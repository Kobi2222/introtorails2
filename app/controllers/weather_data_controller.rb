class WeatherDataController < ApplicationController
  def show
    @weather_data = WeatherDatum.find(params[:id])
  end
end
