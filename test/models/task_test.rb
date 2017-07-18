require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @learn_ruby, @learn_rails, @learn_japanese = tasks(:learn_ruby, :learn_rails, :learn_japanese)
  end

  test "status valid" do
    assert_equal "Done!", @learn_ruby.status
  end

  test "priority valid" do
    assert_equal "Important", @learn_ruby.priority
  end

  test "overdue tasks scope" do
    assert_equal 1, Task.overdue.count
  end

  test "check if task is overdue" do
    assert_not @learn_ruby.overdue?
    assert @learn_rails.overdue?
  end

  test "one task upcoming" do
    assert_equal 1, Task.upcoming.count
  end

  test "tasks without due_date don't fail" do
    assert_not @learn_japanese.overdue?
  end

end
