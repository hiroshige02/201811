class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
    # if resource_class == RegistUser
   protected
      def after_sign_up_path_for(resource)
        case resource
        when RegistUser
          regist_user_path(current_regist_user.id)
        when Admin
          admin_path(current_admin.id)
        end
      end

      def after_sign_in_path_for(resource)
        case resource
        when RegistUser
          regist_user_path(current_regist_user.id)
        when Admin
          admin_path(current_admin.id)
        end
      end

  def after_update_path_for(resource)
    case resource
    when RegistUser
      regist_user_path(current_regist_user.id)
    when Admin
      admin_path(current_admin.id)
    end
  end

  def configure_permitted_parameters
    if resource_class == RegistUser
      devise_parameter_sanitizer.permit(:sign_up, keys: [:regist_name, :regist_name_kana, :birthday, :regist_tel_number, :job])
      elsif resource_class == Admin
        devise_parameter_sanitizer.permit(:sign_up, keys: [:admin_name, :admin_name_kana, :admin_tel_number])
    end
  end

  # protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:admin_name, :admin_name_kana, :admin_tel_number])
  # end

end