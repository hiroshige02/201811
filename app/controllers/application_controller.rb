class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin_name, :admin_name_kana, :admin_tel_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:regist_name, :regist_name_kana, :birthday, :regist_tel_number, :job])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

# :profile_image, :regist_name, :regist_name_kana, :birthday, :job

  end

end
