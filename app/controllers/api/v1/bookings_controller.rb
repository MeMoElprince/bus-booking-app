class Api::V1::BookingsController < ApplicationController
  def index
    bookings = Booking.all
    render json: bookings.to_json(include: [:user, :trip])
  end

  def show
    booking = Booking.find(params[:id])
    render json: booking.to_json(include: [:user, :trip])
  end

  

  private

  def booking_params
    params.permit(:user_id, :trip_id , :count)
  end

end
