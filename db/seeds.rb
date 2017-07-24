# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


admin = User.first_or_create!({
  name: "Administrator",
  email: "admin@doit.com",
  password_digest: BCrypt::Password.create("1234"),
  admin: true
  })

tasks = Task.first_or_create!([{
  title: "Testing to do",
  description: "This appears in the to do sectiomn.",
  priority: 0,
  status: 0,
  due_date: Date.new(2017, 7, 30),
  user_id: admin.id
  },
  {
  title: "Testing doing",
  description: "This appears in the doingb section.",
  priority: 1,
  status: 1,
  due_date: Date.new(2017, 8, 30),
  user_id: admin.id
},
{
  title: "Testing done",
  description: "This appears in the dobne section.",
  priority: 2,
  status: 2,
  due_date: Date.new(2017, 8, 15),
  user_id: admin.id
}])

dashboard = Dashboard.update({
  user_id: admin.id,
  overdue: true
  })
