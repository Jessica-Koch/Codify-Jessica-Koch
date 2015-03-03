require 'rails_helper'

describe 'User can CRUD tasks' do

  before :each do
    User.create(first_name: "User", last_name: "Random", email: "example@test.com", password: "a", password_confirmation: "a")

    visit '/'
    click_on 'Sign In'
    fill_in 'email', :with =>"example@test.com"
    fill_in 'password', :with => "a"
    click_button "Sign In"
    visit '/projects'
    click_on "New Project"
    fill_in 'project[name]', with: "gCamp"
    click_on "Create Project"
    expect(page).to have_content("gCamp")
    expect(page).to have_content("Project was successfully created")
    click_link 'Tasks'
  end

  scenario 'User can create a Task and see showpage' do

    click_on "New Task"

    fill_in "task[description]", :with => "test"

    click_on "Create Task"
    expect(page).to have_content("test")

    expect(page).to have_content("Task was successfully created")
  end

  scenario 'User can visit a show page for a task' do

    click_on "New Task"
    fill_in "task[description]", :with => "test"
    click_on "Create Task"
    expect(page).to have_content("test")
    expect(page).to have_content("Task was successfully created")

    click_on "Show"

    expect(page).to have_content("test")
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
