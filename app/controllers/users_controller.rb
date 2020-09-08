class UsersController < ApplicationController
  # Before the below methods  get called, Application#authorized() is ran; in Application#authorized(), we decode the token passed in via the request's header, find the user associated with the decoded token, and set the instance var of @user to that user. So therefore in the below methods we have access to @user which is the user authorized. 
  before_action :authorized, only: [:persist, :user_items, :update, :validate_current_password, :change_password]

  def login
    @user = User.find_by(username: params[:username])

    # If the user could be found by username and the password is correct, we create a token ffrom the user's id. We then send back the user and the token
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})

      # Use UserSerializer.new() to ensure that user object returned is formatted with all the attributes we specified in user_serializer
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: 'Invalid Username Or Password'}
    end
  end

  def persist
    # Creating a new token based on the user's id
    token = encode_token({user_id: @user.id})

    # Send back the user and the token
    render json: {user: UserSerializer.new(@user), token: token}
  end

  # Creating a new user based on params passed in, if valid, create a token for the user to log them in, render out the user and the token
  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: @user.errors.full_messages}
    end

  end

  # Returns all the items belonging to a particular user, whose token was passed in via headers, after running through helper methods in ApplicationController we have access to the @user found
  def user_items
    items = @user.items
    render json: items
  end

  def update
    if @user.update(user_params)
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: @user.errors.full_messages}
    end
  end

  def validate_current_password
    
    if @user.authenticate(params[:password])
      render json: @user
    else 
      render json: {error: "Invalid current password"}
    end
  end

  def change_password
    if @user.update(password: params[:password])
      render json: @user
    else
      render json: {error: "Could not change password"}
    end

  end

  private
  
  def user_params
    params.permit(:username, :password, :city, :state, :zip, :email, :longitude, :latitude)
  end
end
