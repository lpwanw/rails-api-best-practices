require "rails_helper"

RSpec.describe Api::V1::BlogsController, type: :request do
  describe "POST create new blog" do
    subject { post url, params: params, as: :json }

    let!(:blog) { create :blog }
    let(:id) { blog.id }
    let(:url) { "/api/v1/blogs" }
    let(:params) do
      {
        blog: {
          title: "title",
          content: "content"
        }
      }
    end

    context "when response success" do
      before { subject }

      it { expect(response).to have_http_status :created }
      it { expect(response_body[:success]).to be true }
      it { expect(response_body[:data][:title]).to eq "title" }
      it { expect(response_body[:data][:content]).to eq "content" }
    end

    context "when change Blog Count" do
      it { expect { subject }.to change { Blog.count }.by 1 }
    end
  end
end
