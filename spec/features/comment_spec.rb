require 'rails_helper'


describe 'User can comment on tasks' do

  before :each do
    User.create(first_name: "Pikachu", last_name: "Pokemon", email: "example@test.com", password: "a", password_confirmation: "a")

    visit '/'
    click_on 'Sign In'
    fill_in 'email', :with =>"example@test.com"
    fill_in 'password', :with => "a"
    click_button "Sign In"
    click_on "clicker"
    fill_in 'Name', with: 'Spiffy Project'
    click_button "Create Project"
    click_on "New Task"
    fill_in "task[description]", :with => "practice"
    click_button "Create Task"
    expect(page).to have_content("practice")
    expect(page).to have_content("Task was successfully created")
  end

  scenario 'User can create a comment and list name of user' do

    click_on "practice"
    fill_in "post_box", :with => "I'm a comment!"
    click_button "Add Comment"
    expect(page).to have_content("I'm a comment!")
    expect(page).to have_content("Pikachu")
  end
end
