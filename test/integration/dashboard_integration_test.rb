require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:user)
  end

  test "logged in user should get dashboard" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]
    
    get dashboard_url
    assert_response :success
    assert_select "h1", "Dashboard"
  end

  test "not logged in user should get redirected from dashboard to tasks index" do
    get dashboard_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should get edit page" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    get edit_dashboard_url, params { id}
    assert_response :success
  end

  test "not logged in user should get redirected from edit dashboard to tasks index" do
    get edit_dashboard_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should update the dashboard" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    post dashboard_url
    assert_response :success
  end

  test "not logged in user should be redirected from update dashboard to tasks index" do
    post dashboard_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end

end
