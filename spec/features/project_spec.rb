require 'rails_helper'


describe 'User can CRUD projects' do

  before :each do
    User.create(first_name: "User", last_name: "Random", email: "example@test.com", password: "a", password_confirmation: "a")

    visit '/'
    click_on "Sign In"
    fill_in 'email', :with =>"example@test.com"
    fill_in 'password', :with => "a"

  end

  scenario 'User can create a Project and see show page' do

    click_on "Project"
    Project.create(name: "gCamp Stories")

    click_on "Project"
    expect(page).to have_content("gCamp Stories")
    expect(page).to have_content("Project was successfully created")
    click_on "gCamp Stories"

  end

  scenario 'User can visit a show page for a Project' do

    click_on "Project"
    Project.create(name: "Stories")
    visit '/projects'

    expect(page).to have_content("Stories")

    click_on "Stories"

    expect(page).to have_content("story")

  end
  scenario 'User cannot leave field blank' do

    visit '/projects'

    click_on "New Project"

    fill_in 'project[name]', with: ""

    click_on "Create Project"

    expect(page).to have_content("error prohibited this object from being saved")
  end


  scenario 'User can edit a Project' do

    visit '/projects'

    click_on "New Project"

    fill_in 'project[name]', with: "gCamp"

    click_on "Create Project"

    expect(page).to have_content("gCamp")

    click_on "Edit"

    fill_in 'project[name]', with: "puppy"
    click_on "Update Project"

    expect(page).to have_content("puppy")


  end

  scenario 'User can delete a Project' do

    visit '/projects'

    click_on "New Project"

    fill_in 'project[name]', with: "stories"

    click_on "Create Project"

    expect(page).to have_content("stories")

    click_on "Delete"

    expect(page).to have_no_content("stories")
  end

end
