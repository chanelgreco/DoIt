require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learn_ruby, @learn_rails = tasks(:learn_ruby, :learn_rails)
    @desiree = users(:desiree)
  end

  test "logged in user should get index containing tasks" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    get tasks_index_url
    assert_response :success
    assert_select "h1.task--title"
  end

  test "not logged in user should get index containing no tasks" do
    get tasks_index_url
    assert_response :success
    assert_select "h1.task--title", false
  end

  test "logged in user should see tasks with a seperate tag when overdue" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    get tasks_index_url
    assert_response :success
    assert_select "span.task__overdue", "Overdue!"
  end


  test "logged in user should get new" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    get new_task_url
    assert_response :success
  end

  test "not logged in user should get redirected from task new to tasks index" do
    get new_task_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should create task" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    assert_difference('Task.count') do
      post tasks_url, params: { task: { description: "Something", due_date: "2017-08-22", priority: "Critical", status: "Doing it...", title: "Testing" } }
    end
    assert_redirected_to task_url(Task.last)
  end

  test "not logged in user should be redirected from create task to tasks index" do
    post tasks_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should show task" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    get task_url(@learn_ruby)
    assert_response :success
  end

  test "not logged in user should be redirected from show task to task index" do
    get task_url(@learn_ruby)
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should get edit" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    get edit_task_url(@learn_ruby)
    assert_response :success
  end

  test "not logged in user should get redirected from task edit to task index" do
    get edit_task_url(@learn_ruby)
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should update task" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    patch task_url(@learn_ruby), params: { task: { description: @learn_ruby.description, due_date: @learn_ruby.due_date, priority: @learn_ruby.priority, status: @learn_ruby.status, title: @learn_ruby.title } }
    assert_redirected_to task_url(@learn_ruby)
  end

  test "not logged in user should be redirected from update task to task index" do
    patch task_url(@learn_ruby), params: { task: { description: @learn_ruby.description, due_date: @learn_ruby.due_date, priority: @learn_ruby.priority, status: @learn_ruby.status, title: @learn_ruby.title } }
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should destroy task" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    assert_difference('Task.count', -1) do
      delete task_url(@learn_ruby)
    end

    assert_redirected_to tasks_url
  end

  test "not logged in user should be redirected from destroy task to task index" do
    assert_no_difference('Task.count') do
      delete task_url(@learn_ruby)
    end

    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end

end
