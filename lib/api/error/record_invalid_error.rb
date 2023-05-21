class Api::Error::RecordInvalidError < Api::Error::BaseError
  def initialize(error)
    super(error.message)
    @record = error.record
    @record_errors = record.errors.to_hash(true)
  end

  def status
    :unprocessable_entity
  end

  def errors
    record_errors.map do |attribute, full_messages|
      {
        id: record.id,
        model: record.class.name,
        attribute: attribute,
        full_message: full_messages.first
      }
    end
  end

  private

  attr_reader :record, :record_errors
end
