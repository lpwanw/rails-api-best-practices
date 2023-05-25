class Api::V1::UsersController < Api::V1::BaseController
  def sign_in
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
      token = {
        access_token: Auth.issue(user.auth_payload),
        refresh_token: user.refresh_tokens.create!.token
      }

      json_response token
    else
      raise Api::Error::UnauthorizedError, "Invalid credentials"
    end
  end
end
