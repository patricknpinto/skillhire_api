class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(message = '')
    render json: { error: message }, status: :unprocessable_entity
  end
end
