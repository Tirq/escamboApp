class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resources

  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def layout_by_resources
  	if devise_controller? 
      layout_by_devise
     else 
  		"application"
  	end 
  end

  private

  def layout_by_devise
     resource_name == :admin ? "backoffice_devise" : "site_devise" 
  end

  def user_not_authorized
    flash[:alert] =  I18n.t('messages.not_authorized')
    redirect_to(request.referrer || root_path)
  end 
end
