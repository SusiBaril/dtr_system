require "test_helper"

class User::AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_attendances_index_url
    assert_response :success
  end
end
