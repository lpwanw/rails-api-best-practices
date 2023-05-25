require 'rails_helper'

RSpec.describe RefreshToken, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "Validations" do
    subject { build(:refresh_token) }

    before { RefreshToken.skip_callback(:validation, :before, :generate_token) }
    after { RefreshToken.set_callback(:validation, :before, :generate_token) }

    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_uniqueness_of(:token).case_insensitive }
  end

  describe "Callbacks" do
    describe "#generate_token" do
      context "when token is not taken" do
        subject { build(:refresh_token, token: nil) }

        it "generates a token" do
          expect(subject.token).to be_nil
          subject.save
          expect(subject.token).not_to be_nil
        end
      end

      context "when token is taken" do
        let!(:refresh_token) do
          token = build(:refresh_token, token: "123")
          token.save(validate: false)
        end

        subject { build(:refresh_token, token: nil) }

        before do
          allow(SecureRandom).to receive(:hex).and_return("123", "123", "456")
        end

        it "generates a token" do
          expect(subject.token).to be_nil
          subject.save
          expect(subject.token).to eq "456"
        end
      end
    end
  end
end
