class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate params[:email], params[:password]
	if user
		session[:user_id] = user.id
		redirect_to user_url(user)
	else
		flash[:notice] = "Please enter valid information."
		render 'new'
	end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url
  end
end