class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
      
    if user && user.authenticate(params[:password])
      token = JWT.encode({user_id: user.id}, "password")

      render json: {
        status: 200,
        data: {
          user: user.user_obj,
          token: token
      }
    else
      render json: { 
        status: 401,
        errors: ['no such user', 'verify credentials and try again or signup']
      }
    end
  end

  def auto_login
    user = User.find(session_user)

    if user
      render json: {
        status: 200,
        data: user.user_obj
      }
    else
      render json: {
        status: 401,
        errors: ["No user", "Incorrect credentials"]
      }
    end
  end
end
