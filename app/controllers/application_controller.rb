class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def not_authorized
    flash[:notice] = I18n.t('access.restrict')
    redirect_to root_url and return
  end

end
