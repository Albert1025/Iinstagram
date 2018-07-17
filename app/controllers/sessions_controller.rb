class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path, notice: "Logged in"
  	else
  		render new
  	end
  end

  def destroy
    reset_session
  	session[:user_id] = nil
    current_user = nil
  	redirect_to root_path, notice: "Logged out"
  end
end
