class FlightsController < ApplicationController
  def create
    flight = Flight.new(new_flights_params)

    render json: {
      status: 200,
      message: "You've hit the create controller"
    }
  end


  private

  def new_flights_params
    params.permit[whatever the fuck]
  end
  
end
