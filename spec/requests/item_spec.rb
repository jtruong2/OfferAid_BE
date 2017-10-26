require 'rails_helper'

RSpec.describe "items" do

  before(:each) do
    @user = create(:user)
    @donation = create(:donation, user_id: @user.id)
  end

  context "GET /api/v1/user/:user_id/donations/:donation_id/items" do
    it "outputs all items for a specific donation" do
      item = create(:item)
      donation_item = create(:donation_item, donation_id: @donation.id, item_id: item.id)

      get "/api/v1/user/#{@user.id}/donations/#{@donation.id}/items"

      output = JSON.parse(response.body)

      expect(response).to be_success
      expect(output.count).to eq(1)
      expect(output.first["id"]).to eq(item.id)
    end
  end

  context "POST /api/v1/user/:user_id/donations/:donation_id/items" do
    it "creates a new item" do

      params = { item: {name: "Canned Goods", quantity: 4}}

      post "/api/v1/user/#{@user.id}/donations/#{@donation.id}/items", params: params

      expect(response).to be_success
      expect(Item.count).to eq(1)
      expect(DonationItem.count).to eq(1)
    end
  end
end
