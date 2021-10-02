class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user

  def require_login
    redirect_to new_session_path, alert: "Please login in." and return unless session.include? :user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    redirect_to root_path, alert: "Sorry, Can do that." and return if !current_user&.admin?
  end
end
