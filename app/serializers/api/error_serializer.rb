class Api::ErrorSerializer < ActiveModel::Serializer
  attributes :success, :error_code, :error_message, :errors

  delegate :success, :error_code, :error_message, :errors, to: :object
end
