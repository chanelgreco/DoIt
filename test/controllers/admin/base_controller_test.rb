require 'test_helper'

class Admin::BaseControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desiree = users(:desiree)
    @roger = users(:roger)
  end

  test "admin should get admin index" do
    # log in
    sign_in_as(@desiree)
    assert_equal "Login successfull", flash[:notice]

    # access example.com/admin
    get admin_root_path
    assert_response :success
  end

  test "normal user should not get admin index" do
    # log in
    sign_in_as(@roger)
    assert_equal "Login successfull", flash[:notice]

    # access example.com/admin
    get admin_root_path
    assert_redirected_to tasks_index_path
    assert_equal "You do not have the needed permission to access.", flash[:notice]
  end

end
