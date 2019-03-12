def sign_up
  visit '/'
  click_button('Sign Up')
  fill_in :user_name, with: 'testuser'
  fill_in :email, with: 'username@email.com'
  fill_in :password, with: '123456'
  fill_in :password_confirm, with: '123456'
  click_button('Create Account')
end

def sign_in
  click_button 'Log Out'
  fill_in :user_name, with: 'testuser'
  fill_in :password, with: '123456'
  click_button 'Sign In'
end
