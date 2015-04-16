require 'rails_helper'

describe 'User can CRUD tasks' do

  before :each do
    User.create(first_name: "User", last_name: "Random", email: "example@test.com", password: "a", password_confirmation: "a")

    visit '/'
    click_on 'Sign In'
    fill_in 'email', :with =>"example@test.com"
    fill_in 'password', :with => "a"
    click_button "Sign In"
    click_on "clicker"
    fill_in 'Name', with: 'Spiffy Project'
    click_button "Create Project"
  end

  scenario 'User can create a Task and see showpage' do
    click_on "New Task"
    fill_in "task[description]", :with => "practice"
    click_button "Create Task"
    expect(page).to have_content("practice")
    expect(page).to have_content("Task was successfully created")
  end

  scenario 'User can visit a show page for a task' do

    click_on "New Task"
    fill_in "task[description]", :with => "assignment 1"
    click_on "Create Task"
    expect(page).to have_content("assignment 1")
    expect(page).to have_content("Task was successfully created")
    click_link "assignment 1"
    expect(page).to have_content("assignment 1")
  end

  scenario 'User can edit a task' do

    click_on "New Task"
    fill_in "task[description]", :with => "test"
    click_on "Create Task"
    expect(page).to have_content("test")
    expect(page).to have_content("Task was successfully created")

    click_on "Edit"

    fill_in "task[description]", :with => "test14"
    click_on "Update Task"
    click_on "Task"
    expect(page).to have_content("test14")
  end

scenario "User can delete a task" do
  click_on "New Task"
  fill_in "task[description]", :with => "test"
  click_on "Create Task"
  expect(page).to have_content("test")
  expect(page).to have_content("Task was successfully created")

  click_on "Delete"

  end

end
