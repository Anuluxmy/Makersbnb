# require 'capybara/rspec'

feature 'allows user to sign up' do
  scenario 'displays sign up page' do
    visit('/')
    click_button('Sign Up')
    fill_in :user_name, with: 'username'
    fill_in :email, with: 'username@email.com'
    fill_in :password, with: 'password'
    fill_in :password_confirm, with: 'password'
    click_button('Create Account')
    expect(page).to have_current_path('/')
  end  
end 