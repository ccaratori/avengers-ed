class SessionsController < ApplicationController
  layout "sessions"

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    @user = User.where(username: params[:username]).first
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Avengers homework initiative"
      redirect_to root_path
    else
      session[:user_id] = nil
      flash.now[:alert] = "Ops! Username not found."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
