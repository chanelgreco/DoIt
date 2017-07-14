require 'test_helper'

class DashboardTest < ActiveSupport::TestCase
  setup do
    @dashboard = dashboards(:dashboard_1)
  end

  test "dashboard references the correct user" do
    assert_equal "d.r@gmail.com", @dashboard.user.email
  end

  test "at least one choice made" do
    assert_not_nil @dashboard
  end
end
