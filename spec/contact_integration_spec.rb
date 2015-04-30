require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact adding path', {:type => :feature}) do
  it('Returns the form that allows the user to add a new contact') do
    visit('/')
    click_button('add_a_new_contact')
    expect(page).to have_content('Add a New Contact')
  end
  it('Returns the page listing all contacts') do
    visit('/add_new_contact')
    fill_in('first_name', :with => 'Tony')
    fill_in('last_name', :with => 'Hawk')
    fill_in('birthday', :with => '09/07/1967')
    click_button('submit_contact')
    expect(page).to have_content('Tony Hawk 09/07/1967')
  end
end
