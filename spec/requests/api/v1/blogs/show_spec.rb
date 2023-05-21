require "rails_helper"

RSpec.describe Api::V1::BlogsController, type: :request do
  describe "GET blog by id" do
    let!(:blog) { create :blog }
    let(:id) { blog.id }
    let(:url) { "/api/v1/blogs/#{id}" }

    subject { get url }

    before { subject }

    it { expect(response).to have_http_status :ok }
  end
end
