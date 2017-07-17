require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desiree = users(:desiree)
  end

  test "should prompt for login" do
    get login_url
    assert_response :success
  end


  test "logged in user should get index" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    # access example.com/users
    get users_url
    assert_response :success
  end

  test "not logged in user should get redirected from users index to tasks index" do
    get users_url
    assert_redirected_to tasks_index_url
  end



  test "should get new" do
    get new_user_url
    assert_response :success
  end


  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "email@email.ch", name: "Max Muster", password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to user_url(User.last)
  end


  test "should show user" do
    get user_url(@desiree)
    assert_response :success
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


  test "logged in user should destroy user" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    assert_difference('User.count', -1) do
      delete user_url(@desiree)
    end
    assert_equal "User was successfully destroyed.", flash[:notice]
    assert_redirected_to users_url
  end

  test "not logged in user should get redirected from destroy user to tasks index" do
    assert_no_difference('User.count') do
      delete user_url(@desiree)
    end
    assert_redirected_to tasks_index_path
  end
end
