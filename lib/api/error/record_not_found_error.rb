class Api::Error::RecordNotFoundError < Api::Error::BaseError
  def status
    :not_found
  end
end
