require 'rails_helper'

RSpec.describe BlogSerializer, type: :request do
  let(:blog) { create :blog }
  let(:blog_serializer) { BlogSerializer.new blog }
  let(:subject) { blog_serializer.as_json }
  let(:expected_result) do
    {
      id: blog.id,
      title: blog.title,
      content: blog.content
    }
  end

  it { is_expected.to eq expected_result }
end
