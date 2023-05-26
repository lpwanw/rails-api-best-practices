require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "POST revoke" do
    subject { post url, params: params, as: :json }

    let!(:refresh_token) { create :refresh_token }
    let(:url) { "/api/v1/users/revoke" }
    let(:params) do
      {
        refresh_token: refresh_token.token,
      }
    end

    context "when sign in success" do
      before { subject }

      it { expect(response).to have_http_status :no_content }
    end
    context "when it destroys the refresh token" do
      it { expect { subject }.to change(RefreshToken, :count).by(-1) }
    end

    context "when invalid credentials" do
      let(:params) do
        {
        }
      end

      it_behaves_like "unauthorized", "Invalid refresh token"
    end
  end
end
