class ErrorsController < ActionController::Base
  def not_found
  	render(:status => 200)
  end
end
