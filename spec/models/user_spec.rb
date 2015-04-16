require "rails_helper"

def create_user(options={})
  defaults = {first_name: "Person", last_name: "Thing", email: "example@exampler.com", password: "tester"}

  User.create!(defaults.merge(options))
end

def create_project(options={})
  defaults = {name: "Makin tests"}

  Project.create!(defaults.merge(options))
end


describe User do
  describe "associations" do
    describe "#projects" do
      it "returns all associated projects" do
        project = create_project
        user = create_user
        Membership.create!(project_id: project.id, user_id: user.id)

        expect(user.projects).to eq [project]
      end
    end

    describe "#memberships" do
      it "returns all associated memberships" do
        user = create_user
        membership = Membership.create!(project_id: create_project.id, user_id: user.id)

        expect(user.memberships).to eq [membership]
      end
    end
  end
end
