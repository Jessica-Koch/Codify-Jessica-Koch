require 'rails_helper'


describe 'User can CRUD projects' do

  scenario 'User can create a Project and see show page' do

    visit '/projects'

    click_on "New Project"

    fill_in 'Project[name]', with: "gCamp"

    click_on "Create Project"

    expect(page).to have_content("Jess")
    expect(page).to have_content("Project was successfully created")
  end

  scenario 'Project can visit a show page for a Project' do

    visit '/users'

    click_on "New User"

    fill_in 'user[first_name]', with: "Jess"
    fill_in 'user[last_name]', with: "Koch"
    fill_in 'user[email]', with: "jessicakoch136@gmail.com"

    click_on "Create User"

    visit '/users'
    expect(page).to have_content("Jess")

    click_link('Jess')
    expect(page).to have_content("Jess")

  end
  scenario 'User cannot leave field blank' do

    visit '/users'

    click_on "New User"

    fill_in 'user[first_name]', with: "Jess"
    fill_in 'user[last_name]', with: "Koch"
    fill_in 'user[email]', with: ""

    click_on "Create User"

    expect(page).to have_content("error prohibited this object from being saved")
  end


  scenario 'User can edit a User' do

    visit '/users'

    click_on "New User"

    fill_in 'user[first_name]', with: "Jess"
    fill_in 'user[last_name]', with: "Koch"
    fill_in 'user[email]', with: "jessicakoch136@gmail.com"

    click_on "Create User"

    expect(page).to have_content("Jess")

    click_on "Edit"

    fill_in('user[first_name]', :with => 'Jessica')
    click_on "Update User"

    expect(page).to have_content("Jessica")


  end

  scenario 'User can Delete a User' do

    visit '/users'

    click_on "New User"

    fill_in 'user[first_name]', with: "Jess"
    fill_in 'user[last_name]', with: "Koch"
    fill_in 'user[email]', with: "jessicakoch136@gmail.com"

    click_on "Create User"

    expect(page).to have_content("Jess")

    click_on "Edit"

    click_on "Delete"

    expect(page).to have_no_content("Jessica")
  end

end
