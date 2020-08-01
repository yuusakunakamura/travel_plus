require 'test_helper'

class PlanControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plan_new_url
    assert_response :success
  end

end
