class Api::V1::TripsController < ApplicationController
  def index
    trips = Trip.includes(:departure_city, :arrival_city).all
    render json: trips.to_json(include: [:departure_city, :arrival_city])
  end

  def create
    trip = Trip.new(trip_params)
    if trip.save
      render json: trip, status: 201
    else
      render json: { errors: trip.errors.full_messages }, status: 422
    end
  end

  def show
    trip = Trip.find(params[:id])
    render json: trip
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
  end

  def update
    trip = Trip.find(params[:id])
    # update and validate
    updated_trip = trip.update(trip_params)
    if updated_trip 
      render json: trip
    else
      render json: { errors: trip.errors.full_messages }, status: 422
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:departure_city_id, :arrival_city_id, :departure_time, :bus_id)
  end


end
