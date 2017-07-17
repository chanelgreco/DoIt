require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desiree = users(:desiree)
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get create" do
    post login_url
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]
  end

  test "should get destroy" do
    delete logout_url
    assert_equal "Logged out", flash[:notice]
    assert_redirected_to tasks_index_url
  end

end
