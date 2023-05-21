module JsonResponseHelper
  def response_body
    JSON.parse(response.body).with_indifferent_access
  end
end
