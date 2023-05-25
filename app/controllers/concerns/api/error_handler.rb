module Api::ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :unknown_error # 500
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid # 422
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found # 404
    rescue_from Api::Error::UnauthorizedError, with: :unauthorized # 401
  end

  private

  def record_not_found(error)
    error = Api::Error::RecordNotFoundError.new(error)
    render_error(error)
  end

  def record_invalid(error)
    error = Api::Error::RecordInvalidError.new(error)
    render_error(error)
  end

  def unauthorized(error)
    error = Api::Error::UnauthorizedError.new(error)
    render_error(error)
  end

  def unknown_error(error)
    error = Api::Error::UnknownError.new(error)
    render_error(error)
  end

  def render_error(error)
    render json: Api::ErrorSerializer.new(error).as_json, status: error.status
  end
end
