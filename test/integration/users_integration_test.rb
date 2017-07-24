require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desiree = users(:desiree)
    @roger = users(:roger)
  end

  test "should prompt for login" do
    get login_url
    assert_response :success
  end


  test "should get new" do
    get new_user_url
    assert_response :success
  end


  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "email@email.ch", name: "Max Muster", password: 'secret', password_confirmation: 'secret' } }
    end

    # Verify that email was sent
    email = ActionMailer::Base.deliveries.last
    assert_equal ["email@email.ch"], email.to

    assert_redirected_to tasks_index_path
    assert_equal "User was successfully created. Please log in.", flash[:notice]
  end


  test "logged in user should show user" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    get user_url(@desiree)
    assert_response :success
  end

  test "not logged in user should get redirected from show user to task index" do
    get user_url(@desiree)
    assert_redirected_to tasks_index_path
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should get edit" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    # go to example.com/users/:id/edit
    get edit_user_url(@desiree)
    assert_response :success
  end

  test "not logged in users should get redirected from users edit to tasks index" do
    get edit_user_url(@desiree)
    assert_redirected_to tasks_index_path
  end


  test "logged in user should update user" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    patch user_url(@desiree), params: { user: { email: @desiree.email, name: @desiree.name, password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to user_url(@desiree)
  end

  test "not logged in user should get redirected from users update to tasks index" do
    patch user_url(@desiree), params: { user: { email: @desiree.email, name: @desiree.name, password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to tasks_index_path
  end


  test "logged in user should destroy her own user" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    assert_difference('User.count', -1) do
      delete user_url(@desiree)
    end
    assert_equal "User was successfully destroyed.", flash[:notice]
    assert_redirected_to logout_url
  end

  test "loggen in user should not be able to delte another user" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    assert_no_difference('User.count') do
      delete user_url(@roger)
    end
    assert_redirected_to tasks_index_url
    assert_equal "You can't delete other users.", flash[:notice]
  end

  test "not logged in user should get redirected from destroy user to tasks index" do
    assert_no_difference('User.count') do
      delete user_url(@desiree)
    end
    assert_redirected_to tasks_index_path
  end
end
