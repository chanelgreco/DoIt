require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:user)
    @dashboard = dashboards(:dashboard_1)
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


  test "logged in user should see the overdue tasks on the dashboard page" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    get dashboard_url
    assert_select "h2", "Overdue Tasks"
  end


  test "logged in user should get edit page" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    get dashboard_edit_url
    assert_response :success
  end

  test "not logged in user should get redirected from edit dashboard to tasks index" do
    get dashboard_edit_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end


  test "logged in user should update the dashboard" do
    # log in
    sign_in_as(@user)
    assert_equal "Login successfull", flash[:notice]

    patch dashboard_url, params: { dashboard: { overdue: "0" } }
    assert_redirected_to dashboard_url
    follow_redirect!
    assert_response :success
    assert_equal "Your dashboard was successfully updated.", flash[:notice]
  end

  test "not logged in user should be redirected from update dashboard to tasks index" do
    patch dashboard_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end

end
