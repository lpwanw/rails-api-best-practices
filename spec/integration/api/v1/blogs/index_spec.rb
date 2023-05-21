require "swagger_helper"

RSpec.describe "api/v1/blogs", type: :request do
  path "/api/v1/blogs" do
    get "Get all blogs" do
      tags "Blogs"
      consumes "application/json"
      produces "application/json"

      response "200", "Success" do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            data: {
              type: :array,
              items: {
                "$ref" => "#/components/schemas/blog_response"
              }
            }
          }
        xit
      end

      response "500", "Internal Server Error" do
        schema "$ref" => "#/components/schemas/unknown_error"
        xit
      end
    end
  end
end
