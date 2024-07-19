class ApplicationController < ActionController::API
  



  private

  def authenticate
    token = request.headers["Authorization"]
    if token.nil?
      render json: { errors: ["Unauthorized"] }, status: 401
      return  
    end
    begin
      token = token.split(" ").last
      AuthenticationTokenService.user_from_token(token)
    rescue
      render json: { errors: ["Unauthorized"] }, status: 401
    end
  end

end
