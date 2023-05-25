require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "POST refresh" do
    subject { post url, params: params, as: :json }

    let!(:refresh_token) { create :refresh_token }
    let(:id) { blog.id }
    let(:url) { "/api/v1/users/refresh" }
    let(:params) do
      {
        refresh_token: refresh_token.token,
      }
    end

    context "when sign in success" do
      before { subject }

      it { expect(response).to have_http_status :ok }
      it { expect(response_body[:success]).to be true }
      it { expect(response_body[:data]).to include :access_token }
      it { expect(response_body[:data]).to include :refresh_token }
    end
    context "when it destroys the refresh token" do
      before { subject }

      it { expect(RefreshToken.exists?(id: refresh_token.id)).to be false }
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
