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


  def next_trips
    current_time = Time.now
    current_time += 30.minutes
    trips = Trip.all
    trips.each do |trip|
      trip_time = trip.departure_time.strftime("%H:%M:%S")
      tommorrow = false
      if trip_time < current_time.strftime("%H:%M:%S")
        tommorrow = true
      end
      next_trip_date = trip_time
      if tommorrow == true
        next_trip_date = current_time + 1.day
        next_trip_date = next_trip_date.beginning_of_day.getutc + trip_time.to_i.hours
      else
        next_trip_date = current_time.beginning_of_day.getutc + trip_time.to_i.hours
      end
      # change next trip date to +000
      trip.departure_time = next_trip_date + 3.hours
    end


    # here we have gotten the next trips
    # we will now check if the next trips are available
    # if they are available we will return them

    trips = trips.select do |trip|
      puts trip.bookings
    end


    render json: trips.to_json(include: [:departure_city, :arrival_city])
  end
  
  private

  def trip_params
    params.require(:trip).permit(:departure_city_id, :arrival_city_id, :departure_time, :bus_id)
  end


end
