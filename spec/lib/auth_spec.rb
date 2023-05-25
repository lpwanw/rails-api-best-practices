require "rails_helper"

RSpec.describe Auth do
  describe ".issue" do
    subject { described_class.issue(user.auth_payload) }

    let(:user) { create(:user) }

    it "returns a token" do
      expect(subject).to be_a String
    end
  end

  describe ".decode" do
    subject { described_class.decode(token) }

    let(:user) { create(:user) }
    let(:token) { described_class.issue(user.auth_payload) }

    it "returns a hash" do
      expect(subject).to be_a Hash
    end

    it { expect(subject["sub"]).to eq user.id }
    it { expect(subject["user_name"]).to eq user.user_name }
  end
end
