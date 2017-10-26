require 'rails_helper'

RSpec.describe "Donation" do

  before(:each) do
    @user = create(:user)
    @item_1 = create(:item)
    @item_2 = create(:item)
    @donation_1 = create(:donation, user_id: @user.id)
    @donation_2 = create(:donation, user_id: @user.id)
    @donation_item_1 = create(:donation_item, item_id: @item_1.id, donation_id: @donation_1.id)
    @donation_item_2 = create(:donation_item, item_id: @item_2.id, donation_id: @donation_2.id)
  end

  context "GET /api/v1/user/:user_id/donations" do
    it "outputs all donations by a specific user" do

      get "/api/v1/user/#{@user.id}/donations"

      output = JSON.parse(response.body)

      expect(response).to be_success
      expect(output.count).to eq(2)
      expect(@user.donations.count).to eq(2)
    end
  end

  context "GET /api/v1/user/:user_id/donations/:donation_id" do
    it "outputs a specific donation for a specific user" do

      get "/api/v1/user/#{@user.id}/donations/#{@donation_1.id}"

      output = JSON.parse(response.body)

      expect(response).to be_success
      expect(output["id"]).to eq(@donation_1.id)
    end
  end

  # context "POST /api/v1/user/:user_id/donations/" do
  #   it "creates a new donation" do
  # 
  #     params = { donation: {  }}
  #
  #     post "/api/v1/user/#{@user.id}/donations", params
  #
  #     expect(response).to be_success
  #     expect(@user.donations.count).to eq(3)
  #   end
  # end
end
