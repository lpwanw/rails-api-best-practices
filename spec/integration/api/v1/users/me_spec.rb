require "swagger_helper"

RSpec.describe "api/v1/users/me", type: :request do
  path "/api/v1/users/me" do
    get "User information" do
      tags "Users"
      security [{ bearer_auth: [] }]

      consumes "application/json"
      produces "application/json"

      response "200", "Success" do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 data: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     user_name: { type: :string },
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
