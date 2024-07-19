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
    booking = Booking.new(booking_params)
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
