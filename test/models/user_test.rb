require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @valid, @invalid = users(:valid, :invalid)
    @hans = User.create(name: "Hans", email: "email@email.ch")
  end

  test "valid user" do
    assert @valid.valid?
  end

  test "invalid without name" do
    @valid.name = nil
    refute @valid.valid? "saved user without a name"
    assert_not_nil @valid.errors[:name], "no validation error for name present"
  end

  test "invalid without email" do
    @valid.email = nil
    refute @valid.valid?
    assert_not_nil @valid.errors[:email]
  end

  test "name_email" do
    assert_equal 'Hansemail@email.ch', User.name_email_2(@hans)
    assert_equal 'Hansemail@email.ch', @hans.name_email
  end

  test "tasks" do
    assert_equal 2, @valid.tasks.size
  end
end
