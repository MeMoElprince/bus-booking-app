class Api::V1::Trips::TripRoutesController < ApplicationController
  def index
    # get all routes for a single trip
    trip = Trip.find(params[:trip_id])
    render json: trip.trip_routes.to_json(include: { route: {include: [:city1, :city2]} }), status: 200
  end

  def create
    trip_route = TripRoute.new(trip_route_params)
    if trip_route.save
      render json: trip_route, status: 201
    else
      render json: { errors: trip_route.errors.full_messages }, status: 422
    end
  end

  def show
    trip_route = TripRoute.find(params[:id])
    render json: trip_route.to_json(include: [:trip, :route]), status: 200
  end

  def destroy
    trip_route = TripRoute.find(params[:id])
    trip_route.destroy
    render json: { message: 'Route removed from trip' }, status: 204
  end



  private

  def trip_route_params
    params.permit([:trip_id, :route_id])
  end


end
