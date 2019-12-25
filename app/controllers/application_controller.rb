class ApplicationController < ActionController::API

  def encode_token(id)
    JWT.encode({user_id: id}, ENV['JWT_PASS'])
  end
  
  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    begin
      JWT.decode(auth_header, ENV['JWT_PASS'])[0]["user_id"]
    rescue
      nil
    end
  end

  def session_user
    User.find(decoded_token)
  end

  def logged_in?
    !!session_user
  end
end
