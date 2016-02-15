class UsersController < ApplicationController
  layout "users"

  def index
    @users = User.all.order(:role, :id)
    @new_user = User.new
  end

  def create
    @users = User.all.order(:role, :id)
    @new_user = User.new(user_params)
    
    if @new_user.save
      flash[:notice] = "User created"
      redirect_to users_path
    else
      render :index
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :role)
    end
end
