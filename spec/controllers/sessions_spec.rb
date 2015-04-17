require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "session functions" do
    it "user can sign in" do
      user = User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")
      post :create, { email: user.email, password: user.password}
      expect(response).to  redirect_to projects_path
      end
    end

    describe "end session" do
      it "clears the session and redirects to root path" do
      user = User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")
      post :create,
      { email: user.email, password: user.password}
      delete :destroy
      expect(response).to  redirect_to root_path
    end
  end
end
