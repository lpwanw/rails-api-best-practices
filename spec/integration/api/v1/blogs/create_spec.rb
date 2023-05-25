require "swagger_helper"

RSpec.describe "api/v1/blogs", type: :request do
  path "/api/v1/blogs" do
    post "Create blog" do
      tags "Blogs"
      consumes "application/json"
      produces "application/json"

      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          blog: {
            "$ref" => "#/components/schemas/blog_request"
          }
        }
      }

      response "201", "Success" do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            data: {
              "$ref" => "#/components/schemas/blog_response"
            }
          }
        xit
      end

      response "422", "Unprocessable Entity" do
        schema "$ref" => "#/components/schemas/record_invalid_error"
        xit
      end

      response "500", "Internal Server Error" do
        schema "$ref" => "#/components/schemas/unknown_error"
        xit
      end
    end
  end
end
