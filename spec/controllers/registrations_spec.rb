require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  describe "registration functions" do
    it "user can sign up" do
      post :create, {user:{ first_name: "Jess", last_name: "koch", email: "jk@gmail.com", password: "password"}}
          expect(response).to  redirect_to new_project_path
      end
    end
  end
