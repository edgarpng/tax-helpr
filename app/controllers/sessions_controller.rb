class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate params[:email], params[:password]
  	if user
  		session[:user_id] = user.id
      @fiscal_month = FiscalMonth.first || FiscalMonth.new
  		redirect_to fiscal_month_path(@fiscal_month)
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