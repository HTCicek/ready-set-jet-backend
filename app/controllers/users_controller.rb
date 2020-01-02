class UsersController < ApplicationController
  def create
    user = User.new(user_create_params[:user])

    if user.save
      token = encode_token(user.id)
      render json: {
        user: user.user_obj,
        token: token
      }
    else
      render json: error_json(user)
    end
  end

  def show
    show_user = User.find(params[:id])
    user = session_user
    return unless user == show_user
    render json: {
      status: 200,
      user: show_user.user_obj
    }
  end

  def update
    user = session_user
    user.update(user_update_params)
    if user.valid?
      user.save
      render json: {
          status: 202,
          user: user.user_obj
      }
    else
      render json: error_json(user)
    end
  end

  def destroy
    user = session_user
    user.destroy
    render json: {
      status: 200
    }
  end

  private

  def user_create_params
    params.permit(user:{})
  end
  
  def user_update_params
    params.permit(
      :username,
      :bed_time,
      :wake_up_time
    )
  end

  def error_json(user)
    { errors: user.errors.full_messages }
  end
end
