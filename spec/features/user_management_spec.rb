require 'rails_helper'


describe 'User can CRUD users and Sessions work' do

  scenario 'User can register and see a show page' do
    visit '/'
    click_on "Sign Up"
    fill_in 'user[first_name]', with: "Doggie"
    fill_in 'user[last_name]', with: "Dog"
    fill_in 'user[email]', with: "doggie@icloud.com"
    fill_in 'user[password]', with: "a"
    fill_in 'user[password_confirmation]', with: "a"
    click_on "Create User"
    expect(page).to have_content("Doggie")
    click_on  'Doggie'
    expect(page).to have_content("Doggie")
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
     fill_in 'user[first_name]', with: "Joe"
     fill_in 'user[last_name]', with: "Koch"
     fill_in 'user[email]', with: "joe@icloud.com"
     fill_in 'user[password]', with: "a"
     fill_in 'user[password_confirmation]', with: "a"
     click_on "Create User"
     expect(page).to have_content("Joe")
     click_on "Joe"
     click_on "Edit"
     fill_in('user[first_name]', :with => 'Joey')
     click_on "Update User"
     expect(page).to have_content("Joey")
   end


   scenario 'User can Delete a User' do
     visit '/'
     click_on "Sign Up"
     fill_in 'user[first_name]', with: "Mario"
     fill_in 'user[last_name]', with: "Super"
     fill_in 'user[email]', with: "supermario@icloud.com"
     fill_in 'user[password]', with: "a"
     fill_in 'user[password_confirmation]', with: "a"
     click_on "Create User"
     expect(page).to have_content("Mario")
     click_on "Mario"
     click_on "Edit"
     click_on "Delete"
     expect(page).to have_no_content("Mario")
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
   User.create(first_name: "Terry", last_name: "Faber", email: "tf@icloud.com", password: "a", password_confirmation: "a")
   visit '/'
   click_on 'Sign In'
   fill_in 'email', :with =>"tf@icloud.com"
   fill_in 'password', :with => "a"
   click_button "Sign In"
   visit '/'
   expect(page).to have_content("Terry")
   click_on "Sign Out"
   expect(page).to have_content("We're sorry to see you go!")
   expect(page).to have_no_content("Terry")
 end

  scenario 'User cannot edit other users' do
    @user = User.create(first_name: "Mike", last_name: "Snyder", email: "mike@icloud.com", password: "a", password_confirmation: "a")
    @member = User.create(first_name: "Vulpix", last_name: "Pokemon", email: "fluffy@test.com", password: "a", password_confirmation: "a")
    visit '/'
    click_on 'Sign In'
    fill_in 'email', :with =>"mike@icloud.com"
    fill_in 'password', :with => "a"
    click_button "Sign In"
    visit "/users/#{@member.id}/edit"
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
