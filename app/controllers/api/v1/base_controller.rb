class Api::V1::BaseController < ActionController::API
  include Api::JsonResponse
  include Api::ErrorHandler
end
