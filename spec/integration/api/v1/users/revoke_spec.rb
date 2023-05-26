require "swagger_helper"

RSpec.describe "api/v1/users/revoke", type: :request do
  path "/api/v1/users/revoke" do
    post "Refresh Token" do
      tags "Users"
      consumes "application/json"
      produces "application/json"

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          refresh_token: { type: :string, example: "refresh_token" }
        }, required: %w[refresh_token]
      }

      response "204", "Success" do; end

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
