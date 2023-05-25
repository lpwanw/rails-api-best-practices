require "rails_helper"

RSpec.describe User, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:refresh_tokens).dependent(:destroy) }
  end

  describe "Validations" do
    subject { build :user }

    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_length_of(:user_name).is_at_least(3).is_at_most(20) }
    it { is_expected.to validate_uniqueness_of(:user_name).case_insensitive }

    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
  end

  describe "Methods" do
    describe "#auth_payload" do
      subject { build :user }

      it "returns a hash" do
        expect(subject.auth_payload).to be_a Hash
      end

      it { expect(subject.auth_payload[:sub]).to eq subject.id }
      it { expect(subject.auth_payload[:user_name]).to eq subject.user_name }
      it { expect(subject.auth_payload[:exp]).to be_a Integer }
    end
  end
end
