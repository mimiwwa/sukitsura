class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
 # sign_inのときに、usernameも許可する
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
 #  account_updateのときに、usernameも許可する
    devise_parameter_sanitizer.for(:account_update).push(:nickname, :avatar)


  end

  def after_sign_out_path_for(resource)
    '/' # サインアウト後のリダイレクト先URL
  end


end

