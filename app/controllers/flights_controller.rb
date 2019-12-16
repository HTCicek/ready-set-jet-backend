class FlightsController < ApplicationController
  def create
    flight = Flight.new(new_flights_params)
  end

  private

  def new_flights_params
    params.permit[whatever the fuck]
  end
  
end
