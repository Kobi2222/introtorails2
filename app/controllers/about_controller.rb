class AboutController < ApplicationController
  def index
    # Add details about data sources
    @data_sources = [
      {
        name: "OpenWeatherMap API",
        description: "Provides weather data for cities worldwide.",
        link: "https://openweathermap.org/api"
      },
      {
        name: "Faker Gem",
        description: "Generates fake data for testing and development purposes.",
        link: "https://github.com/faker-ruby/faker"
      }
    ]
  end
end
