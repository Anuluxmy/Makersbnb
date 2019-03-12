feature 'Signing-in' do
  scenario 'signs in and shows username at top of index page' do
    visit '/'
    click_button('Sign Up')

    fill_in :user_name, with: 'testuser'
    fill_in :email, with: 'username@email.com'
    fill_in :password, with: '123456'
    fill_in :password_confirm, with: '123456'
    click_button('Create Account')

    click_button 'Log Out'

    fill_in :user_name, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign In'
    expect(page).to have_content 'Hello, testuser'
  end
end
