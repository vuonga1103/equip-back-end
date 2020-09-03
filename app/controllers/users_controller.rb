class UsersController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: {error: 'Invalid Username Or Password'}
    end
  end
end
