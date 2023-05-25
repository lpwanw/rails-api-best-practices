require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "POST create new blog" do
    subject { post url, params: params, as: :json }

    let!(:user) { create :user }
    let(:id) { blog.id }
    let(:url) { "/api/v1/users/sign_in" }
    let(:params) do
      {
        user_name: user.user_name,
        password: "Aa@123456"
      }
    end

    context "when sign in success" do
      before { subject }

      it { expect(response).to have_http_status :ok }
      it { expect(response_body[:success]).to be true }
      it { expect(response_body[:data]).to include :access_token }
      it { expect(response_body[:data]).to include :refresh_token }
    end

    context "when invalid credentials" do
      let(:params) do
        {
        }
      end

      it_behaves_like "unauthorized", "Invalid credentials"
    end
  end
end
