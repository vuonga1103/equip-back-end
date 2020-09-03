class ApplicationController < ActionController::API

  # THIS FUNCTION TAKES IN WHAT YOU WANT TO ENCODE, RETURNS A JWT STRING TOKEN
  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, ENV['JWT_SECRET'])
  end

  # THIS FUNCTION CHECKS THE REQUEST HEADERS AND RETURN THE VALUE TO THE AUTHORIZATION KEY
  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  # THIS FUNCTION PARSES THE VALUE OF THE AUTHORIZATION KEY FROM THE HEADER, AND ASSIGN THE JWT STRING TO THE VARIABLE TOKEN
  # THIS FUNCTION DECODDES THE TOKEN USING THE SECRET, AND HAVE A BEGIN/RESCUE BLOCK, IN THE CASE THAT THE TOKEN COULD NOT BE DECODED, TO RETURN NIL; IF THE TOKEN WAS SUCCESSFULLY DECODED, THE DECODED PAYLOAD WILL BE RETURNED
  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  # THIS TAKES THE VALUE OF THE USER_ID KEY OUT OF THE DECODED TOKEN (WHICH IS AN ARRAY OF HASHES, THE FIRST ELEMENT OF WHICH IS THE PAYLOAD OBJECT), AND ASSIGN IT TO VAR USER_ID
  # THIS FUNCTION FINDS A USER IN THE DB WITH THAT USER_ID
  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  # THIS RETURNS TRUE IF THE USER IN LOGGED_IN_USER IS FOUND/TRUTHY
  def logged_in?
    !!logged_in_user
  end
  
  # IF THE USER IS NOT LOGGED_IN, THEN, RENDER A MESSAGE TO THE USER AND SEND UNAUTHORIZED STATUS
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
