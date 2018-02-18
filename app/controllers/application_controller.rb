class ApplicationController < ActionController::API
  respond_to :json
  before_action :authenticate_user!
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  def render_404(exception)
    render json: { error: exception.message }, status: :not_found
  end
  
end
