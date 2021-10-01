class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Enjoy your day!"
    else
      redirect_to new_user_path, alert: "Something went wrong."
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :password)
  end
end