class Api::V1::BusesController < ApplicationController
  def index
    buses = Bus.all
    render json: buses.to_json(include: :seats)
  end


  def show
    bus = Bus.find(params[:id])
    render json: bus.to_json(include: :seats)
  end

  def destroy
    bus = Bus.find(params[:id])
    # iterate over seats and destroy them
    bus.seats.each do |seat|
      seat.destroy
    end
    bus.destroy
    render json: { message: "Bus and seats deleted" }
  rescue ActiveRecord::DeleteRestrictionError => e
    render json: { errors: e.message }, status: 422
  end


  def create
    seats = params[:seats].to_a
    bus = Bus.new()
    if bus.save
      seats.each do |seat|
        data = {
          number: seat,
          bus_id: bus.id
        }
        seat = Seat.new(data)
        if seat.save
          puts "Seat saved with number #{seat.number} and bus_id #{seat.bus_id}"
        else
          bus.destroy
          render json: { errors: seat.errors.full_messages }, status: 422
          return
        end
      end
      render json: bus.to_json(include: :seats), status: 201
      return
    else
      render json: { errors: bus.errors.full_messages }, status: 422
      return
    end
  end


  private

  def bus_params
    params.require(:bus).permit(:seats)
  end

  

end
