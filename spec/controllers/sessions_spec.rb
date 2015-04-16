require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "session functions" do
    it "user can sign in" do
      user = User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")
      post :create, { email: user.email, password: user.password}
          response.should redirect_to projects_path
      end
    end
  end
