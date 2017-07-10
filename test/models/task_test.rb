require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @valid_1 = tasks(:valid_1)
  end

  test "status valid" do
    assert_equal "Done!", @valid_1.status
  end

  test "priority valid" do
    assert_equal "Important", @valid_1.priority
  end
end
