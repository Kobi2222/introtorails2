require "test_helper"

class DataNavigationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get data_navigation_index_url
    assert_response :success
  end
end
