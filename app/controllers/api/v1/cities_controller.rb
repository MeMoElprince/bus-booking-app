class Api::V1::CitiesController < ApplicationController
  
  def index
    cities = City.all
    render json: cities
  end

  def show
    city = City.find(params[:id])
    render json: city
  end

  def create
    city = City.new(name: params[:name])
    if city.save
      render json: city
    else
      render json: { errors: city.errors.full_messages }, status: 422
    end
  end

  def update
    city = City.find(params[:id])
    city.update(name: params[:name])
    render json: city
  end

  def destroy
    city = City.find(params[:id])
    city.destroy
  end 
end
