RSpec.shared_examples "record_not_found" do |message, model|
  before { subject }

  it { expect(response_body[:success]).to be false }
  it { expect(response_body[:error_code]).to eq "RECORD_NOT_FOUND_ERROR" }
  it { expect(response_body[:error_message]).to eq message }
  it { expect(response).to have_http_status(:not_found) }
end

RSpec.shared_examples "record_invalid" do |message|
  before { subject }

  it { expect(response_body[:success]).to be false }
  it { expect(response_body[:error_code]).to eq "RECORD_INVALID_ERROR" }
  it { expect(response_body[:error_message]).to eq message }
  it { expect(response).to have_http_status(:unprocessable_entity) }
end

RSpec.shared_examples "unauthorized" do |message|
  before { subject }

  it { expect(response_body[:success]).to be false }
  it { expect(response_body[:error_code]).to eq "UNAUTHORIZED_ERROR" }
  it { expect(response_body[:error_message]).to eq message }
  it { expect(response).to have_http_status(:unauthorized) }
end
