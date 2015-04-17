require 'rails_helper'

feature 'user CRUD projects' do

  before :each do
    User.create(first_name: "User", last_name: "Random", email: "example@test.com", password: "a", password_confirmation: "a")

    visit '/'
    click_on "Sign In"
    fill_in 'email', :with =>"example@test.com"
    fill_in 'password', :with => "a"
    click_button 'Sign In'

  end

  scenario 'User can create a Project and see show page' do

    click_on "clicker"
    fill_in 'Name', with: 'Spiffy Project'
    click_button "Create Project"
    expect(page).to have_content("Tasks for Spiffy Project")
    expect(page).to have_content("Project was successfully created!")
    click_link("Spiffy Project", :match => :first)
    expect(page).to have_content("Tasks")
    expect(page).to have_content("1 Membership")
    expect(page).to have_content("Delete Project")

  end

  scenario 'User can visit a show page for a Project' do

    click_on "clicker"
    fill_in 'Name', with: 'Spiffy Project2'
    click_button "Create Project"
    expect(page).to have_content("Tasks for Spiffy Project2")
    expect(page).to have_content("Project was successfully created!")
    click_link("Spiffy Project2", :match => :first)
    expect(page).to have_content("Spiffy Project2")

  end
  scenario 'User cannot leave field blank' do
    click_on "clicker"
    fill_in 'Name', with: ""
    click_button "Create Project"
    expect(page).to have_content("1 error prohibited this form from being saved:")
  end


  scenario 'User can edit a Project' do
    click_on "clicker"
    fill_in 'Name', with: 'Spiffiest Project'
    click_button "Create Project"
    expect(page).to have_content("Spiffiest Project")
    click_link("Spiffiest Project", :match => :first)
    click_on "Edit"
    fill_in 'project[name]', with: "Homework"
    click_on "Update Project"
    expect(page).to have_content("Homework")
  end

  scenario 'User can delete a Project' do
    click_on "clicker"
    fill_in 'Name', with: 'Spiffiest Project'
    click_button "Create Project"
    expect(page).to have_content("Spiffiest Project")
    click_link("Spiffiest Project", :match => :first)
    click_on "Delete"
    expect(page).to have_no_content("Spiffiest Project")
  end

  scenario 'User directed to tasks index page upon project creation' do
    click_on "clicker"
    fill_in 'Name', with: 'Spiffy Project'
    click_button "Create Project"
    expect(page).to have_content("Tasks for Spiffy Project")
    expect(page).to have_content("Project was successfully created!")
    expect(page).to have_content("Tasks for Spiffy Project")
  end
end
