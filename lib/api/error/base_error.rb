class Api::Error::BaseError < StandardError
  def success
    false
  end

  def error_code
    error_path = self.class.name.split("::").map(&:underscore).map(&:downcase) - %w[api error]
    error_path.join("_").upcase
  end

  def error_message
    i18n_message || message
  end

  def errors
    []
  end

  def status
    raise NotImplementedError
  end

  private

  def i18n_message
    i18n_path = self.class.name.split("::").map(&:underscore).join(".")
    i18n_path = "#{i18n_path}.message"

    I18n.t i18n_path, default: nil
  end
end
