class LocationController < ApplicationController
  def Index
  end

  def show
    @location = Location.find_by(id: params[:id])
  end
end
