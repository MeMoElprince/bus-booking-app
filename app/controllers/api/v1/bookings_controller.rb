class Api::V1::BookingsController < ApplicationController

  before_action :authenticate , only: [:create]

  def index
    bookings = Booking.all
    render json: bookings.to_json(include: [:user, :trip])
  end

  def show
    booking = Booking.find(params[:id])
    render json: booking.to_json(include: [:user, :trip])
  end

  def create

    # we recive the user_id and trip_id and count of seats to book
    # no money for now 
    # we have to check if there is enough seats in the trip
    # if there is enough seats we book the seats
    # if not we return an error message
    # we have to check if the user has already booked the trip

    user = AuthenticationTokenService.user_from_token(request.headers["Authorization"].split(" ").last)
    data = {
      user_id: user.id,
      trip_id: booking_params[:trip_id],
      count: booking_params[:count]
    }
    trip = Trip.find(data[:trip_id])
    # we get all bookings for this next trip
    bookings = Booking.where(trip_id: data[:trip_id])
  
    # if iterate all books and check if the curennt booking is as my booking or not
    counter = 0
    bookings.each do |booking|
      my_time = Time.now
      booked_time = booking.created_at
      my_time += 30.minutes
      booked_time += 30.minutes
      # i should get the next trip time 
      trip_time = trip.departure_time.strftime("%H:%M:%S")
      my_next_trip_time = my_time 
      booked_next_trip_time = booked_time
      my_tommorrow = false
      booked_tommorrow = false
      if trip_time < my_next_trip_time.strftime("%H:%M:%S")
        my_tommorrow = true
      end
      if trip_time < booked_next_trip_time.strftime("%H:%M:%S")
        booked_tommorrow = true
      end
      if my_tommorrow == true
        my_next_trip_time = my_time + 1.day
        my_next_trip_time = my_next_trip_time.beginning_of_day.getutc + trip_time.to_i.hours
      else  
        my_next_trip_time = my_time.beginning_of_day.getutc + trip_time.to_i.hours
      end 
      if booked_tommorrow == true
        booked_next_trip_time = booked_time + 1.day
        booked_next_trip_time = booked_next_trip_time.beginning_of_day.getutc + trip_time.to_i.hours
      else
        booked_next_trip_time = booked_time.beginning_of_day.getutc + trip_time.to_i.hours
      end
      if my_next_trip_time + 3.hours == booked_next_trip_time 
        counter += booking.count
      end
    end

    if counter + data[:count] > trip.bus.seats.count 
      render json: { errors: ["Not enough seats"] }, status: 422
      return
    end
    
    booking = Booking.new(data)
    if booking.save
      render json: booking, status: 201
    else
      render json: { errors: booking.errors.full_messages }, status: 422
    end

  end

  private

  def booking_params
    params.permit(:user_id, :trip_id , :count)
  end

end
