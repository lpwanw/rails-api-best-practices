class Api::Error::UnknownError < Api::Error::BaseError
  def status
    :internal_server_error
  end
end
