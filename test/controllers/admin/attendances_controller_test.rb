require "test_helper"

class Admin::AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_attendances_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_attendances_show_url
    assert_response :success
  end
end
