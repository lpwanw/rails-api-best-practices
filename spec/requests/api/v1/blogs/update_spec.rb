require "rails_helper"

RSpec.describe Api::V1::BlogsController, type: :request do
  describe "PUT update blog" do
    subject { put url, params: params, as: :json }

    let!(:blog) { create :blog }
    let(:id) { blog.id }
    let(:url) { "/api/v1/blogs/#{id}" }
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

      it { expect(response).to have_http_status :ok }
      it { expect(response_body[:success]).to be true }
      it { expect(response_body[:data][:title]).to eq "title" }
      it { expect(response_body[:data][:content]).to eq "content" }
    end

    context "when not change Blog Count" do
      it { expect { subject }.not_to change { Blog.count } }
    end

    context "when invalid record" do
      let(:params) do
        {
          blog: {
            title: "",
            content: ""
          }
        }
      end

      it_behaves_like "record_invalid", "Validation failed: Title can't be blank, Content can't be blank"
    end
  end
end
