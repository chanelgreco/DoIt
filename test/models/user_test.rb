require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @desiree, @roger = users(:desiree, :roger)
  end

  test "valid user" do
    assert @roger.valid?
  end

  test "invalid without name" do
    @roger.name = nil
    refute @roger.valid? "saved user without a name"
    assert_not_nil @roger.errors[:name], "no validation error for name present"
  end

  test "invalid without email" do
    @roger.email = nil
    refute @roger.valid?
    assert_not_nil @roger.errors[:email]
  end

  # test "name_email" do
  #   @roger.name_email
  #   byebug
  #   assert_not_nil @name_email
  # end

  test "tasks" do
    assert_equal 2, @roger.tasks.size
  end
end
