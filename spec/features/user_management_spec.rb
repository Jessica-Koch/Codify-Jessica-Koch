require 'rails_helper'


describe 'User can CRUD users and Sessions work' do

  scenario 'User can register and see a show page' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Jessica"
    fill_in 'user[last_name]', with: "Koch"
    fill_in 'user[email]', with: "jessicakoch136@icloud.com"
    fill_in 'user[password]', with: "a"
    fill_in 'user[password_confirmation]', with: "a"
    click_on "Create User"
    expect(page).to have_content("Jessica")
    click_on  'Jessica'
    expect(page).to have_content("Jessica")
    end

   scenario 'User cannot leave field blank' do
     visit '/'
     click_on "Sign Up"
     fill_in 'user[first_name]', with: "Jessica"
     fill_in 'user[last_name]', with: "Koch"
     fill_in 'user[email]', with: ""
     fill_in 'user[password]', with: "a"
     fill_in 'user[password_confirmation]', with: "a"
     click_on "Create User"
     expect(page).to have_content("error prohibited this form from being saved")
   end


   scenario 'User can edit a User' do
     visit '/'
     click_on "Sign Up"
     fill_in 'user[first_name]', with: "Jessica"
     fill_in 'user[last_name]', with: "Koch"
     fill_in 'user[email]', with: "jessicakoch136@icloud.com"
     fill_in 'user[password]', with: "a"
     fill_in 'user[password_confirmation]', with: "a"
     click_on "Create User"
     expect(page).to have_content("Jessica")
     click_on "Jessica"
     click_on "Edit"
     fill_in('user[first_name]', :with => 'Jess')
     click_on "Update User"
     expect(page).to have_content("Jess")
   end


   scenario 'User can Delete a User' do
     visit '/'
     click_on "Sign Up"
     fill_in 'user[first_name]', with: "Jessica"
     fill_in 'user[last_name]', with: "Koch"
     fill_in 'user[email]', with: "jessicakoch136@icloud.com"
     fill_in 'user[password]', with: "a"
     fill_in 'user[password_confirmation]', with: "a"
     click_on "Create User"
     expect(page).to have_content("Jessica")
     click_on "Jessica"
     click_on "Edit"
     click_on "Delete"
     expect(page).to have_no_content("Jessica")
   end


   scenario 'User can Signin' do
    User.create(first_name: "Jessica", last_name: "Koch", email: "jessicakoch136@icloud.com", password: "a", password_confirmation: "a")
    visit '/'
    click_on 'Sign In'
    fill_in 'email', :with =>"jessicakoch136@icloud.com"
    fill_in 'password', :with => "a"
    click_button "Sign In"
    visit '/'
    expect(page).to have_content("Jessica")
  end


  scenario 'User cannot signin with invalid credentials' do
    User.create(first_name: "Jessica", last_name: "Koch", email: "jessicakoch136@icloud.com", password: "a", password_confirmation: "a")
    visit '/'
    click_on 'Sign In'
    fill_in 'email', :with =>"jessicakoch136@icloud.com"
    fill_in 'password', :with => "b"
    click_button "Sign In"
    expect(page).to have_content("Username / password combination is invalid")
  end

  scenario 'User can Signout' do
   User.create(first_name: "Jessica", last_name: "Koch", email: "jessicakoch136@icloud.com", password: "a", password_confirmation: "a")
   visit '/'
   click_on 'Sign In'
   fill_in 'email', :with =>"jessicakoch136@icloud.com"
   fill_in 'password', :with => "a"
   click_button "Sign In"
   visit '/'
   expect(page).to have_content("Jessica")
   click_on "Sign Out"
   expect(page).to have_content("We're sorry to see you go!")
   expect(page).to have_no_content("Jessica")
 end
end
