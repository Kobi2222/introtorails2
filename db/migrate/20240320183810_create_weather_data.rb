class CreateWeatherData < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_data do |t|
      t.references :location, null: false, foreign_key: true
      t.float :temperature
      t.float :humidity
      t.float :wind_speed
      t.string :condition

      t.timestamps
    end
  end
end
