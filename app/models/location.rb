class Location < ApplicationRecord
    has_many :users
    has_many :weather_data
  
    validates :city, :country, presence: true
  end
  