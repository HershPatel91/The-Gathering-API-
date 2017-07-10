class ApplicationController < ActionController::API

private

def user_id
	request.headers['Authorization']
end


def current_user
	@current_user ||= User.find_by(id: user_id)
end

def authorize_user!
	if !current_user.present?
		render json: {error: 'No user id present'}
	end
end


end
