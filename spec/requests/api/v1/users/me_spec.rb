require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "GET user information" do
    subject { get url, headers: headers, as: :json }

    let(:url) { "/api/v1/users/me" }
    let!(:current_user) { create :user }
    let(:access_token) { Auth.issue(current_user.auth_payload) }
    let(:headers) do
      {
        "Authorization" => "Bearer #{access_token}",
      }
    end

    it_behaves_like "authenticate_user!"

    context "when success" do
      before { subject }

      it { expect(response).to have_http_status :ok }
      it { expect(response_body[:success]).to be true }
      it { expect(response_body[:data][:id]).to eq current_user.id }
      it { expect(response_body[:data][:user_name]).to eq current_user.user_name }
    end
  end
end
