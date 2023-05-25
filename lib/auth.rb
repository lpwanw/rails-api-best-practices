module Auth
  extend self

  ALGORITHM = "HS256"

  def issue(payload)
    JWT.encode(payload, secret_key, ALGORITHM)
  end

  def decode(token)
    JWT.decode(token, secret_key, true, { algorithm: ALGORITHM }).first
  end

  private

  def secret_key
    ENV["AUTH_SECRET"]
  end
end
