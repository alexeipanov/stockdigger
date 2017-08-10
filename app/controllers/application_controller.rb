class ApplicationController < ActionController::API
  #  include ActionController::Helpers
  #  include ActionController::Flash
  include Knock::Authenticable

  private

  # Define unauthorized access json response
  def unauthorized_entity
    render json: { error: 'Unauthorized request' }, status: :unauthorized
  end
end
