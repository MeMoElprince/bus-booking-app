class Api::V1::RoutesController < ApplicationController
  def index
    routes = Route.all
    render json: routes
  end

  def create
    route = Route.new(route_params)
    if route.save
      render json: route, status: 201
    else
      render json: { errors: route.errors.full_messages }, status: 422
    end
  end

  def update
    route = Route.find(params[:id])
    route.update(route_params)
    render json: route
  end

  def destroy
    route = Route.find(params[:id])
    route.destroy
  end

  # def show
  #   route = Route.find(params[:id])
  #   render json: route
  # end
  # 

  private

  def route_params
    params.require(:route).permit(:city1_id, :city2_id, :cost, :duration)
  end




end
