RSpec.shared_examples "authenticate_user!" do
  before { subject }

  context "when empty token" do
    let(:access_token) {}

    it_behaves_like "unauthorized", "Malfunction token"
  end

  context "when invalid token" do
    let(:access_token) do
      JWT.encode({}, "random_secret_key", "HS256")
    end

    it_behaves_like "unauthorized", "Invalid token"
  end

  context "when expired token" do
    let(:access_token) do
      Auth.issue({ user_id: current_user.id, exp: 1.second.ago.to_i })
    end

    it_behaves_like "unauthorized", "Expired token"
  end
end
