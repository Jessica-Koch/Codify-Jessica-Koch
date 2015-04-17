require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  before :each do
    @user = User.create!(first_name: 'persona',
    last_name: 'persone',
    email: "blah@blah.com",
    password: "a",
    admin: false)
    @project = Project.create!(name: 'testing')
    session[:user_id] = @user.id
  end

  describe "GET #index" do
    render_views
    it "user signed in to see index" do
      user = User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")
      get :index
      expect(response).to render_template (:index)
    end
  end

  describe "GET #show" do
    context "user is project member"
    before do
      @nonmember = User.create(first_name: 'intruder',
      last_name: 'joe',
      email: "intruder@blah.com",
      password: "a",
      admin: false)
      session[:user_id] = @nonmember.id
    end

    it "renders the :index" do
      get :show, id: @project.id
      expect(response).to redirect_to projects_path
    end
  end

  describe "POST #create" do
    context "user signed in"
    it "creates a new project with creator as owner" do
      post :create, {project: {name: 'example'}}

      expect(@user.memberships.last.role).to eq("owner")
    end
  end

end
