class UsersController < ApplicationController
  before_action :authorized, only: [:persist, :user_items]

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])

      token = encode_token({user_id: @user.id})
      
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: 'Invalid Username Or Password'}
    end
  end


  def persist
    # we have access to @user here thanks to application#authorized and all the helper functions defined in ApplicationController, we use it to encode the user's id into a token, and send back the user and the token
    token = encode_token({user_id: @user.id})
    render json: {user: UserSerializer.new(@user), token: token}
  end


  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: {error: @user.errors.full_messages}
    end

  end

  def user_items
    items = @user.items
    render json: items
  end

  private
  
  def user_params
    params.permit(:username, :password, :city, :state, :zip, :email, :longitude, :latitude, :distance)
  end
end
