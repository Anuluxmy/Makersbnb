# require 'capybara/rspec'

feature 'allows user to sign up' do
  scenario 'displays sign up page' do
    sign_up
    expect(page).to have_content 'Hello, testuser'
  end
end
