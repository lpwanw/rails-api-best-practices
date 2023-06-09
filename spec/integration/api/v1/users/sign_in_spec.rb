require "swagger_helper"

RSpec.describe "api/v1/users/sign_in", type: :request do
  path "/api/v1/users/sign_in" do
    post "Sign In" do
      tags "Users"
      consumes "application/json"
      produces "application/json"

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user_name: { type: :string, example: "user_name" },
          password: { type: :string, example: "password" }
        }, required: %w[user_name password]
      }

      response "200", "Success" do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 data: {
                   type: :object,
                   properties: {
                     access_token: {
                       type: :string, example: "access_token",
                       description: "JWT token, expires in 4 days"
                     },
                     refresh_token: { type: :string, example: "refresh_token" }
                   }
                 }
               }
        xit
      end

      response "401", "Unauthorized" do
        schema "$ref" => "#/components/schemas/unauthorized_error"
        xit
      end

      response "500", "Internal Server Error" do
        schema "$ref" => "#/components/schemas/unknown_error"
        xit
      end
    end
  end
end
