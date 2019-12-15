class UserController < ApplicationController
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      token = JWT.encode({user_id: user.id}, "password")
      render json: {
        user: user.user_obj,
        token: token
      }
    else
      render json: {
        errors: user.errors.full_messages
      }
    end
  end
end
