class DataNavigationController < ApplicationController
  def index
    @query = params[:query]
    @location_id = params[:location_id]
    
    if @query.present? || @location_id.present?
      # Build the base query
      query = WeatherDatum.joins(:location)
                           .where(
                             WeatherDatum.column_names.map { |column| "weather_data.#{column} LIKE :query" }.join(" OR ") +
                             " OR locations.city LIKE :query OR locations.country LIKE :query",
                             query: "%#{@query}%"
                           )

      # Filter by location_id if present
      if @location_id.present?
        query = query.where(locations: { id: @location_id })
      end

      # Paginate the results
      @data_entries = query.page(params[:page]).per(10)
    else
      @data_entries = WeatherDatum.all.page(params[:page]).per(10)
    end

    @user = User.first
  end
end
