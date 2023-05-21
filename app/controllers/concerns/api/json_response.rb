module Api::JsonResponse
  extend ActiveSupport::Concern

  private

  def json_response(object, status = :ok)
    render json: { data: object, success: true }, status: status
  end

  def collection_serializer(collection, serializer)
    ActiveModelSerializers::SerializableResource.new(collection, each_serializer: serializer)
  end
end
