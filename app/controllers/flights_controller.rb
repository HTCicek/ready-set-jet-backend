class FlightsController < ApplicationController
  def create
    # byebug
    user = session_user
    flight = user.flights.create(flight_create_params[:flight])
    if flight.valid?
      render json: {
        status: 200,
        flight: flight.flight_obj
      }
    else
      render json: {
        errors: flight.errors.full_messages
      }
    end
  end


  private

  def flight_create_params
    params.permit(flight: {})
  end
  
end
