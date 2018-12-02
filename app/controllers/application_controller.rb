class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :authenticate_user!

    



   protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_age, :user_sex, :stylist_name, :salon_name, :stylist_age])
    end

end
