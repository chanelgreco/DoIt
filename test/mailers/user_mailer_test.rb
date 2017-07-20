require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "user receives email" do
    # Create the email
    email = UserMailer.welcome_email(users(:desiree))

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end
  end
end
