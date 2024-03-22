class WeatherDatum < ApplicationRecord
  belongs_to :location

  validates :temperature, :humidity, :wind_speed, :condition, presence: true
end
