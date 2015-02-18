require 'rails_helper'

describe 'User can CRUD tasks' do

  scenario 'User can create a Task' do

    visit '/'

    click_on "Tasks"

    click_on "New Task"

    fill_in "task[description]", :with => "party"

    click_on "Create Task"
    expect(page).to have_content("party")
  end

  
end
