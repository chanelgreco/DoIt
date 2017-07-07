# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users = User.create([{ name: 'Chanel Greco', email: 'chanel.greco@simplificator.com', password_digest: '1234'])

test_user = User.first_or_create!({
  name: "test_user",
  email: "test@test.ch",
  password_digest: BCrypt::Password.create("1234"),
  })

tasks = Task.first_or_create!([{
  title: "Testing to do",
  description: "Does this appear in the to do section?",
  priority: 0,
  status: 0,
  due_date: Date.new(2017, 7, 30),
  user_id: test_user.id
  },
  {
  title: "Testing doing",
  description: "Does this appear in the doing section?",
  priority: 1,
  status: 1,
  due_date: Date.new(2017, 8, 30),
  user_id: test_user.id
},
{
  title: "Testing done",
  description: "Does this appear in the done section?",
  priority: 2,
  status: 2,
  due_date: Date.new(2017, 8, 15),
  user_id: test_user.id
}])
