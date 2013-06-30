class HomeController < ApplicationController
  def index
  end

  def create
    omniauth = request.env["omniauth.auth"]
    puts omniauth
    user = User.where(uid: omniauth['uid']).first
    if user
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
    else
      puts '#################################'
      puts '#################################'
      puts '#################################'
      puts '#################################'
      puts omniauth['uid']
      puts '#################################'
      puts '#################################'
      puts '#################################'
      session[:uid] = omniauth['uid']
      redirect_to new_user_registration_url
    end
  end
end
