require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "user permissions" do
    it "user cannot edit other users" do
      user = User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")
      user2 = User.create(first_name: "Charizard", last_name: "Pokemon", email: "tester@tester.com", password: "a", password_confirmation: "a")
      session[:user_id] = user.id
      get :edit, id: user2.id
      expect(response.status).to eq(404)
    end
  end
end
