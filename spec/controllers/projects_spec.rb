require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #index" do
    render_views
    it "user must sign in to see index" do
      user = User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")
      get :index
      expect(response).to redirect_to login_path
    end
  end
end
