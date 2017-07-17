class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::Flash

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
