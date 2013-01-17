class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user), :notice => "Signed up!"
    else
      render "new"
    end
  end

  def new
    @user = User.new    
  end

  def edit
  end

  def show
    @user = User.find_by_id session[:user_id]
  end

  def destroy
  end

  def update
  end
end
