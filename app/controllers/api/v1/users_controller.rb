module Api
  module V1
    
    class UsersController < ApplicationController
    
      # hash password
      # generate token
      # return user and token
      
      before_action :authenticate, only: [:index]
    
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
          token = AuthenticationTokenService.call(user)
          render json: { user: user, token: token }
        else
          render json: { errors: user.errors.full_messages }, status: 422
        end
      end
    
      def login
        username = params[:username]
        password = params[:password]
        if(username.nil? || password.nil?)
          render json: { errors: ["Username and password are required"] }, status: 422
          return
        end
        user = User.find_by(username: username)
  
        if user.nil?
          render json: { errors: ["User not found"] }, status: 404
          return
        end
        puts user.inspect
        if user.authenticate(password)
          token = AuthenticationTokenService.call(user)
          render json: { user: user, token: token }
        else
          render json: { errors: ["Invalid password"] }, status: 401
        end
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
  end
end

