require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @desiree = users(:desiree)
    @hans = User.create(name: "Hans", email: "email@email.ch")
  end

  test "valid user" do
    assert @desiree.valid?
  end

  test "invalid without name" do
    @desiree.name = nil
    refute @desiree.valid? "saved user without a name"
    assert_not_nil @desiree.errors[:name], "no validation error for name present"
  end

  test "invalid without email" do
    @desiree.email = nil
    refute @desiree.valid?
    assert_not_nil @desiree.errors[:email]
  end

  test "name_email" do
    assert_equal 'Hansemail@email.ch', User.name_email_2(@hans)
    assert_equal 'Hansemail@email.ch', @hans.name_email
  end

  test "tasks" do
    assert_equal 3, @desiree.tasks.size
  end

  test "initialize dashboard gets called" do
    @markus = User.create(name: "Markus", email: "markus@test.ch", password: "1234")
    assert_not_nil @markus.dashboard
  end
end
