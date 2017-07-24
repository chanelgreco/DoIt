require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desiree, @roger, @admin =  users(:desiree, :roger, :admin)
  end

  test "admin should get index" do
    # log in
    sign_in_as(@desiree)
    get admin_users_path
    assert_response :success
  end

  test "should get show" do
    # log in
    sign_in_as(@desiree)
    get admin_user_path(@roger)
    assert_response :success
  end

  test "should get new" do
    # log in
    sign_in_as(@desiree)
    get new_admin_user_path
    assert_response :success
  end

  test "should get edit" do
    # log in
    sign_in_as(@desiree)
    get edit_admin_user_path(@roger)
    assert_response :success
  end

  test "should get create" do
    # log in
    sign_in_as(@desiree)
    assert_difference('User.count') do
      post admin_users_path, params: { user: { email: "admin_user@email.ch", name: "Admin Dude", password: "secret", password_confirmation: "secret" } }
    end
    assert_equal 'User was successfully created. Please send the users her/his credentials.', flash[:notice]
    assert_redirected_to admin_users_path
  end

  test "should get update" do
    # log in
    sign_in_as(@desiree)
    patch admin_user_path(@roger), params: { user: { password: "new", password_confirmation: "new" } }
    assert_redirected_to admin_user_path
    assert_equal 'User was successfully updated.', flash[:notice]
  end

  test "should get destroy" do
    # log in
    sign_in_as(@desiree)
    delete admin_user_path(@roger)
    assert_redirected_to admin_users_path
    assert_equal 'User was successfully destroyed.', flash[:notice]
  end

  test "should not be able to destroy the Admininistrator user" do
    # log in
    sign_in_as(@desiree)
    delete admin_user_path(@admin)
    assert_redirected_to admin_users_path
    assert_equal 'The Administrator can not be deleted.', flash[:notice]
  end

end
