class SessionsController < ApplicationController
  layout "sessions_layout"

  def new
  end

  def create
    @user = User.where(username: params[:username]).first
    if @user
      session[:user_id] = @user.id
      redirect_to root_url
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
