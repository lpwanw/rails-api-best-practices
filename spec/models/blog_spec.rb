require "rails_helper"

RSpec.describe Blog, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end
end
