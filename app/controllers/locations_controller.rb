class LocationsController < ApplicationController
  def index
    locations = Location.all.map(&:location_obj)

    render json: {
      status: 200,
      airports: locations
    }
  end
end
