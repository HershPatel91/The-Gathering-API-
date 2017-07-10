class Api::V1::AuthController < ApplicationController
  # before_action :authorize_user!, only: [:show]

  def show
    if current_user.present?
    render json: user
    else
      # otherwise, render back some error response
      render json: {
        error: 'No user id present on the headers'
      }, status: 404
    end
  end

  def create
    # see if there is a user with this username
     user = User.find_by(email: params[:email])
     
    # if there is, make sure that they have the correct password
    if user.present? && user.authenticate(params[:password])
       # if they do, render back a json response of the user info
       render json: user
     else
      # otherwise, render back some error response
      render json: {
        error: 'Username or password incorrect'
      }, status: 404
    end
  end
end

