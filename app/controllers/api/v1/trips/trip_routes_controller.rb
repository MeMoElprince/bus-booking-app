class Api::V1::Trips::TripRoutesController < ApplicationController
  def index
    # get all routes for a single trip
    trip = Trip.find(params[:trip_id])
    render json: trip.trip_routes
  end

  def create
  end

  def show
  end

  def destroy
  end

  def update
  end


  private

  def trip_route_params
    params.require(:trip_route).permit(:trip_id, :route_id)
  end


end
