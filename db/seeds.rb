# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Create 50 locations
50.times do
  location = Location.create(
    city: Faker::Address.city,
    country: Faker::Address.country
  )
  location.latitude = Faker::Address.latitude.to_f
  location.longitude = Faker::Address.longitude.to_f
  location.save
end

# Create 100 users with random locations
100.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    location: Location.offset(rand(Location.count)).first,
  )

  # Generate weather data for each user's location
  WeatherDatum.create(
    location: user.location,
    temperature: Faker::Number.between(from: -20, to: 40),
    humidity: Faker::Number.between(from: 0, to: 100),
    wind_speed: Faker::Number.between(from: 0, to: 30),
    condition: "Weather Condition"
  )
end

User.first(10).each do |user|
  user.admin = true
end