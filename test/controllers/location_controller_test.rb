require "test_helper"

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get location_Index_url
    assert_response :success
  end
end
