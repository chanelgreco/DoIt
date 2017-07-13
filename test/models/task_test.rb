require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @valid_1, @valid_2 = tasks(:valid_1, :valid_2)
  end

  test "status valid" do
    assert_equal "Done!", @valid_1.status
  end

  test "priority valid" do
    assert_equal "Important", @valid_1.priority
  end

  test "overdue tasks scope" do
    assert_equal 1, Task.overdue.count
  end

  test "check if task is overdue" do
    assert_not @valid_1.overdue?
    assert @valid_2.overdue?
  end
end
