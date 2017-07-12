require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "new user creates account and a task" do
    # Access application
    get tasks_index_url
    assert_response :success
    assert_select "ul.align-right li a", "Create Account"

    # Create account
    get new_user_url
    assert_response :success
    assert_select "h1", "New Account"

    # Save account and get redirected to the show page
    post users_url,
      params: { user: { name: "Markus Muster", email: "m.m@gmail.com", password: 'secret', password_confirmation: 'secret' } }

    assert_redirected_to user_url(User.last)
    assert_equal "User was successfully created.", flash[:notice]


    # Login with account credentials
    get login_url
    assert_response :success
    assert_select "h3", "Please Log In"
    sign_in_as(User.last)

    assert_redirected_to tasks_index_url
    assert_equal "Login successfull", flash[:notice]


    # Create new task
    get new_task_url
    assert_response :success
    assert_select "h1", "New Task"

    # Save new task and get redirected to the show page
    post tasks_url,
      params: { task: { title: "Testing", description: "Let's do some testing.", priority: "Critical", status: "Doing it...", due_date: "2017-09-01" } }

    assert_redirected_to task_url(Task.last)
    assert_equal "Task was successfully created.", flash[:notice]

    # Click the 'Back' button and see newly created task
    get tasks_url
    assert_response :success
    assert_select "h1.task--title", "Testing"

  end
end
