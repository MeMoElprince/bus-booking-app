class Api::V1::UsersController < ApplicationController

  # hash password
  # generate token
  # return user and token

  def signup
    password = params[:password]
    password_confirm = params[:password_confirm]

    if(password.nil? || password_confirm.nil?)
      render json: { errors: ["Password and password confirmation are required"] }, status: 422
      return
    end

    if password != password_confirm
      render json: { errors: ["Passwords do not match"] }, status: 422
      return
    end

    data = user_params
    data[:password] = password

    user = User.new(data)  
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def login
  end


  private



  def user_params
    params.require(:user).permit([
      :username,
      :phone,
      :test
    ])
  end
end
