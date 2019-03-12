feature 'Logging out' do
  scenario 'displays the homepage with no Hello, [username] message present' do

    visit '/'
    click_button('Sign Up')

    fill_in :user_name, with: 'testuser'
    fill_in :email, with: 'username@email.com'
    fill_in :password, with: '123456'
    fill_in :password_confirm, with: '123456'
    click_button('Create Account')

    click_button 'Log Out'

  end
end
