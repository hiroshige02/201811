class RegistUserParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:regist_name, :email, :password)
  end
end