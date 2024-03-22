require "test_helper"

class WeatherDataControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weather_data_show_url
    assert_response :success
  end
end
