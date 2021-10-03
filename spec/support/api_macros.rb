module ApiMacros
  def login_admin
    @user = create(:user)
    @user.admin!
    session[:user_id] = @user.id
  end
end
