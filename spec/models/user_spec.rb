require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    subject { build :user }

    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_length_of(:user_name).is_at_least(3).is_at_most(20) }
    it { is_expected.to validate_uniqueness_of(:user_name).case_insensitive }

    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }
  end
end
