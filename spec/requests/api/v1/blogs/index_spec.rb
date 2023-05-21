require "rails_helper"

RSpec.describe Api::V1::BlogsController, type: :request do
  describe "GET /api/v1/blogs" do
    subject { get url }
    let!(:blogs) { create_list :blog, 10 }
    let(:url) { "/api/v1/blogs" }

    before { subject }

    it { expect(response).to have_http_status :ok }
    it { expect(response_body[:success]).to be true }
    it { expect(response_body[:data].count).to eq 10 }
  end
end
