class ApplicationController < ActionController::Base
  
    protect_from_forgery with: :exception, prepend: true

    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_out_path_for(resource_or_scope)
       new_user_session_path
    end    

    protected
       def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :name, :email, :password)}
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :name, :email, :password, :current_password)}
       end
          
end
