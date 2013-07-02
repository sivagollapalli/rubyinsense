class RegistrationsController <  Devise::RegistrationsController 
  def build_resource(*args)
    super
    @user.uid = session[:uid]
    @user.valid?
  end
end
