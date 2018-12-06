class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   

   def after_sign_out_path_for(resource)
    users_top_path # ログアウト後に遷移するpathを設定
  end

    



   protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_age, :user_sex, :stylist_name, :salon_name, :stylist_age])
    end

end
