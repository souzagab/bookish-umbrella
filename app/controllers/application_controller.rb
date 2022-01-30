# ApplicationController
class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!
  rescue_from CanCan::AccessDenied, with: :forbidden!

  def route_not_found!
    render json: { error: "Route not found!" }, status: :not_found
  end

  def not_found!(err = nil, message: "Resource not found!")
    render json: { error: err.try(:message) || message }, status: :not_found
  end

  def forbidden!(err = nil, message: "Forbidden")
    render json: { error: err.try(:message) || message }, status: :forbidden
  end
end
