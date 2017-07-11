require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:valid_1)
    @user = users(:user)
  end

  test "logged in user should get index containing tasks" do
    # log in
    sign_in_as(@user)
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


  test "logged in user should get new" do
    # log in
    sign_in_as(@user)
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
    sign_in_as(@user)
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
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    get task_url(@task)
    assert_response :success
  end

  test "not logged in user should be redirected from show task to task index" do
    get task_url(@task)
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should get edit" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    get edit_task_url(@task)
    assert_response :success
  end

  test "not logged in user should get redirected from task edit to task index" do
    get edit_task_url(@task)
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should update task" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    patch task_url(@task), params: { task: { description: @task.description, due_date: @task.due_date, priority: @task.priority, status: @task.status, title: @task.title } }
    assert_redirected_to task_url(@task)
  end

  test "not logged in user should be redirected from update task to task index" do
    patch task_url(@task), params: { task: { description: @task.description, due_date: @task.due_date, priority: @task.priority, status: @task.status, title: @task.title } }
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should destroy task" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test "not logged in user should be redirected from destroy task to task index" do
    assert_no_difference('Task.count') do
      delete task_url(@task)
    end

    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end

end
