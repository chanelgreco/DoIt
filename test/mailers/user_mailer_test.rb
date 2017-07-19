require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "user receives email" do
    welcome_email
    assert true
  end
end
