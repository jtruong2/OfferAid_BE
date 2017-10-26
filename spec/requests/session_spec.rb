require 'rails_helper'

RSpec.describe "Session" do
  context "POST /api/v1/login" do
    it "creates a new session for user with valid credentials" do
      user = create(:user)
      params = { session: { email: user.email, password: user.password}}

      post "/api/v1/login", params: params

      output_start = JSON.parse(response.body)

      expect(output_start["status"]).to eq("logged in")
      expect(output_start["user"]["id"]).to eq(user.id)
    end

    it "fails to create a session with invalid credentials" do
      user = create(:user)
      params = { session: { email: user.email, password: "Wrong Password"}}

      post "/api/v1/login", params: params

      output = JSON.parse(response.body)

      expect(output["status"]).to eq("login failed")
      expect(output["message"]).to eq("Email or password is incorrect")
    end
  end

  context "GET /api/v1/current_user" do
    it "outputs current user" do
      user = create(:user)
      params = { session: { email: user.email, password: user.password}}
      post "/api/v1/login", params: params
      output_start = JSON.parse(response.body)

      expect(output_start["status"]).to eq("logged in")
      expect(output_start["user"]["id"]).to eq(user.id)

      get "/api/v1/current_user"
      output_end = JSON.parse(response.body)

      expect(output_end["id"]).to eq(user.id)
    end
  end

  context "DELETE /api/v1/logout" do
    it "destroys current session" do
      user = create(:user)
      params = { session: { email: user.email, password: user.password}}
      post "/api/v1/login", params: params
      get "/api/v1/current_user"

      output = JSON.parse(response.body)

      expect(output["id"]).to eq(user.id)

      delete "/api/v1/logout"
      get "/api/v1/current_user"
      output_end = JSON.parse(response.body)

      expect(output_end).to eq(nil)
    end
  end
end
