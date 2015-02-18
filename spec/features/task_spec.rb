require 'rails_helper'

describe 'User can CRUD tasks' do

  scenario 'User can create a Task and see showpage' do

    visit '/'

    click_on "Tasks"

    click_on "New Task"

    fill_in "task[description]", :with => "test"

    click_on "Create Task"
    expect(page).to have_content("test")
    expect(page).to have_content("Task was successfully created")
  end

  scenario 'User can visit a show page for a task' do

    visit '/tasks'

    click_on "New Task"

    fill_in "task[description]", :with => "test"

    click_on "Create Task"

    expect(page).to have_content("test")

    visit '/tasks'

    click_link("test")

    expect(page).to have_content("test")
  end

  scenario 'User can edit an event' do
    visit '/tasks'

    click_on "New Task"

    fill_in "task[description]", :with => "test"

    click_on "Create Task"

    expect(page).to have_content("test")

    click_on "Edit"

       fill_in('Description', :with => 'test2')
       click_on "Update Task"

    expect(page).to have_content('test2')
  end
scenario "User can delete a task" do
  visit '/tasks'
  click_on "New Task"

  fill_in "task[description]", :with => "test"

  click_on "Create Task"

  expect(page).to have_content("test")

  visit '/tasks'

  click_on('Delete')

  expect(page).to have_no_content("test")

end
end
