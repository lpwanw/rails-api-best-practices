class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_refresh_token, only: :refresh

  def sign_in
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
      json_response user.auth_token
    else
      raise Api::Error::UnauthorizedError, "Invalid credentials"
    end
  end

  def refresh
    ActiveRecord::Base.transaction do
      @token.destroy!
      json_response @token.user.auth_token
    end
  end

  private

  def authenticate_refresh_token
    @token = RefreshToken.find_by(token: params[:refresh_token])
    return if @token

    raise Api::Error::UnauthorizedError, "Invalid refresh token"
  end
end
