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

      response "404", "Not Found" do
        schema "$ref" => "#/components/schemas/record_not_found_error"
        xit
      end

      response "500", "Internal Server Error" do
        schema "$ref" => "#/components/schemas/unknown_error"
        xit
      end
    end
  end
end
