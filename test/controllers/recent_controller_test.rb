require "test_helper"

class RecentControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get recent_add_url
    assert_response :success
  end
end
