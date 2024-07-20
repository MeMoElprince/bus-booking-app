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

    # trips = trips.select do |trip|
    #   puts trip.bookings
    # end


    render json: trips.to_json(include: [:departure_city, :arrival_city])
  end


  def next_trips_for_route


    puts "-----------------"
    puts "entered....."
    puts "----------------"
    current_time = Time.now
    # to reserve bus before deadline with 30 mins
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

    # trips = trips.select do |trip|
    #   puts trip.bookings
    # end

    

    trips = trips.select do |trip|
      city1_id = city_params[:city1_id]
      city2_id = city_params[:city2_id]
      graph = {}
      trip.trip_routes.each do |route|
        if(!graph[route.route.city1_id].nil?)
          graph[route.route.city1_id].push(route.route.city2_id)
        else
          graph[route.route.city1_id] = [route.route.city2_id]
        end
      end

      # 
      if(valid_path_bfs(graph, city1_id, city2_id) == false)
        next
      end
      true
    end


    render json: {count: trips.length, trips: JSON.parse(trips.to_json(include: [:departure_city, :arrival_city]))}, status: 200
  

  end

  private

  def trip_params
    params.require(:trip).permit(:departure_city_id, :arrival_city_id, :departure_time, :bus_id)
  end

  def city_params 
    params.require(:trip).permit(:city1_id, :city2_id)
  end

end
