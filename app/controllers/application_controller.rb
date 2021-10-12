class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:first_name_kana,:last_name,:last_name_kana,:address,:postal_code,:telephone_number])
  end

  def after_sign_up_path_for(resource)
      public_root_path
  end

  def after_sign_in_path_for(resource)
      public_items_path
  end

  def after_sign_out_path_for(resource)
       public_root_path
  end
end
