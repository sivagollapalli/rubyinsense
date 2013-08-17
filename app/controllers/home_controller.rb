class HomeController < ApplicationController
  def index
  end

  def create
    omniauth = request.env["omniauth.auth"]
    user = User.where(uid: omniauth['uid']).first
    if user
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
      cookies[:user_id] = user.id
    else
      session[:uid] = omniauth['uid']
      redirect_to new_user_registration_url
    end
  end
end
