class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource)
    '/users/sign_in'  # サインアウト後のリダイレクト先URL
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
