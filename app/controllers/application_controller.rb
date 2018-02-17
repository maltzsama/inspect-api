class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  attr_reader :current_user
  
  def render_404(exception)
    render json: {error: exception.message}, status: :not_found
  end
  
end
