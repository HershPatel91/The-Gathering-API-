class Api::V1::AuthController < ApplicationController
  # before_action :authorize_user!, only: [:show]

  # def show
  #   render json: {
  #       id: current_user.id,
  #       email: current_user.email
  #      }
  # end

  def create
    # see if there is a user with this username
     user = User.find_by(email: params[:user][:email])
    # if there is, make sure that they have the correct password
    if user.present?
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
