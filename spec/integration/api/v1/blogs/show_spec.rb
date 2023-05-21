require "swagger_helper"

RSpec.describe "api/v1/blogs", type: :request do
  path "/api/v1/blogs/{id}" do
    get "Get blog" do
      tags "Blogs"
      consumes "application/json"
      produces "application/json"
      parameter name: :id, in: :path, type: :string

      response "200", "Success" do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            data: {
              "$ref" => "#/components/schemas/blog_response"
            }
          }
        xit
      end
    end
  end
end
