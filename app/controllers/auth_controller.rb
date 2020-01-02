class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
      
    if user && user.authenticate(params[:password])
      token = encode_token(user.id)

      render json: {
        status: 200,
        user: user.user_obj,
        token: token
      }
    else
      render json: { 
        status: 401,
        errors: ['No such user', 'Verify credentials, and try again']
      }
    end
  end

  def auto_login
    user = session_user

    if user
      render json: {
        status: 200,
        user: user.user_obj
      }
    else
      render json: {
        status: 401,
        errors: ["No user", "Incorrect credentials"]
      }
    end
  end
end
