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
    assert_equal "Dashboard", "h1"
  end

  test "not logged in user should get redirected from dashboard to tasks index" do
    get dashboard_url
    assert_redirected_to tasks_index_url
    assert_equal "Please log in", flash[:notice]
  end

end
