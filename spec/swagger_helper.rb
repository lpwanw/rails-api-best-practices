# frozen_string_literal: true

require "rails_helper"

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you"re using the rswag-api to serve API descriptions, you"ll need
  # to ensure that it"s configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join("swagger").to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the "rswag:specs:swaggerize" rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe "...", swagger_doc: "v2/swagger.json"
  config.swagger_docs = {
    "v1/swagger.yaml" => {
      openapi: "3.0.1",
      info: {
        title: "API V1",
        version: "v1"
      },
      paths: {},
      servers: [
        {
          url: "https://{defaultHost}",
          variables: {
            defaultHost: {
              default: "www.example.com"
            }
          }
        }
      ],
      components: {
        schemas: {
          blog_response: {
            type: "object",
            properties: {
              id: { type: "integer" },
              title: { type: "string" },
              content: { type: "string" }
            }
          },
          blog_request: {
            type: "object",
            properties: {
              title: { type: "string" },
              content: { type: "string" }
            },
            required: %w[title content]
          },
          unknown_error: {
            type: "object",
            properties: {
              success: { type: "boolean", default: false },
              error_code: { type: "string", default: "UNKNOWN_ERROR" },
              error_message: { type: "string", default: "Unknown error" },
              errors: { type: "array" }
            }
          },
          record_invalid_error: {
            type: "object",
            properties: {
              success: { type: "boolean", default: false },
              error_code: { type: "string", default: "RECORD_INVALID_ERROR" },
              error_message: { type: "string", default: "Record invalid error" },
              errors: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "integer" },
                    model: { type: "string", example: "Blog" },
                    attribute: { type: "string", example: "title" },
                    full_message: { type: "string", example: "Title can't be blank" }
                  }
                }
              }
            }
          },
          record_not_found_error: {
            type: "object",
            properties: {
              success: { type: "boolean", default: false },
              error_code: { type: "string", default: "RECORD_NOT_FOUND_ERROR" },
              error_message: { type: "string", default: "Record not found error" },
              errors: { type: "array" }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running "rswag:specs:swaggerize".
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ":json" and ":yaml".
  config.swagger_format = :yaml
end
