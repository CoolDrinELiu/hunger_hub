class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    session_params = params.permit(:name, :password)
    @user = User.find_by(name: session_params[:name])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Good to see you!"
    else
      redirect_to new_session_path, notice: "Login is invalid!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been signed out!"
  end
end