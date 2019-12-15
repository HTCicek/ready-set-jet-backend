class ApplicationController < ActionController::API
  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    JWT.decode(auth_header, "password")[0]["user_id"]
  end

  def session_user
    User.find(decoded_token)
  end
end
