require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  setup do
    @markus = {
      name: "Markus Muster",
      email: "m.m@gmail.com"
      password: '1234',
      password_confirmation: '1234'
    }

    @task_1 = {
      title: "Testing",
      description: "Let's do some testing.",
      priority: "Critical",
      status: "Doing it...",
      due_date: "2017-09-01"
    }
  end

  test "user creates account and a task" do
    # Access application
    get '/'


    # Create account

    # Login with account credentials

    # Create new task


  end
end
