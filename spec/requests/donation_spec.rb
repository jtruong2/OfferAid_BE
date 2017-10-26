require 'rails_helper'

RSpec.describe "Donation" do
  context "GET /api/v1/user/:id/donations" do
    it "outputs all donations by a specific user" do
      user = create(:user)
      donations = create_list(:donation, 3, user_id: user.id)

      get "/api/v1/user/#{user.id}/donations"

      output = JSON.parse(response.body)

      expect(response).to be_success
      expect(output.count).to eq(3)
      expect(user.donations.count).to eq(3)
    end
  end
end
