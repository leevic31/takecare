require "test_helper"

class HoldsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get holds_create_url
    assert_response :success
  end

  test "should get destroy" do
    get holds_destroy_url
    assert_response :success
  end
end
