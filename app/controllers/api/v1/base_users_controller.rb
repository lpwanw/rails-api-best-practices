class Api::V1::BaseUsersController < Api::V1::BaseController
  before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers["Authorization"]&.split(" ")&.last
    decoded_token = Auth.decode(token)
    @current_user = User.find(decoded_token["sub"])
  rescue JWT::ExpiredSignature
    raise Api::Error::UnauthorizedError, "Expired token"
  rescue JWT::VerificationError
    raise Api::Error::UnauthorizedError, "Invalid token"
  rescue JWT::DecodeError
    raise Api::Error::UnauthorizedError, "Malfunction token"
  end

  def current_user
    @current_user
  end
end
