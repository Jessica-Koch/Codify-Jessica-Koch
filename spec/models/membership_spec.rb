require "rails_helper"

describe Membership do
  describe "associations" do
    it "responds to user" do
      expect(Membership.new).to respond_to(:user)
    end

    it "responds to project" do
      expect(Membership.new).to respond_to(:project)
    end
  end
end
