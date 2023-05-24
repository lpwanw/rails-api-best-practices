require "rails_helper"

RSpec.describe Api::V1::BlogsController, type: :request do
  describe "GET blog by id" do
    let!(:blog) { create :blog }
    let(:id) { blog.id }
    let(:url) { "/api/v1/blogs/#{id}" }

    subject { get url }

    before { subject }

    it { expect(response).to have_http_status :ok }

    context "when invalid id" do
      let(:id) { "invalid_id" }

      it_behaves_like "record_not_found", "Couldn't find Blog with 'id'=invalid_id"
    end
  end
end
