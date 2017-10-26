require 'rails_helper'

RSpec.describe "User API" do
  context "GET /api/v1/user/:id" do
    it "outputs a single user" do
      user = create(:user)

      get "/api/v1/user/#{user.id}"

      output = JSON.parse(response.body)

      expect(response).to be_success
      expect(output['id']).to eq(user.id)
      expect(output['first_name']).to eq(user.first_name)
    end
  end

  context "POST /api/v1/user" do
    it "creates a new user" do
      user = build(:user)
      params = { user: {first_name: user.first_name, last_name: user.last_name, street_address: user.street_address, city: user.city, state: user.state, zip_code: user.zip_code, email: user.email, password: user.password}}
      post "/api/v1/user", params: params

      output = JSON.parse(response.body)

      expect(response).to be_success
      expect(User.count).to eq(1)
      expect(User.first.first_name).to eq(user.first_name)
    end

    it "save fails without password" do
      user = build(:user)
      params = { user: {first_name: user.first_name, last_name: user.last_name, street_address: user.street_address, city: user.city, state: user.state, zip_code: user.zip_code, email: user.email}}

      post "/api/v1/user", params: params

      expect(User.count).to eq(0)
    end

    it "save fails without email" do
      user = build(:user)
      params = { user: {first_name: user.first_name, last_name: user.last_name, street_address: user.street_address, city: user.city, state: user.state, zip_code: user.zip_code, password: user.password}}

      post "/api/v1/user", params: params

      expect(User.count).to eq(0)
    end
  end
end
