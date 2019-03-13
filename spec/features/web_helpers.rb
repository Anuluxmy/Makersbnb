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

def create_space
  click_button('List of Spaces')
  click_button('Create Space')
  fill_in :space_name, with: 'test space'
  fill_in :description, with: 'test description'
  fill_in :price_per_night, with: '700'
  fill_in :from_day, with: '1'
  page.select('January', :from => 'from_month')
  fill_in :to_day, with: '10'
  page.select('January', :from => 'to_month')
  click_button('Submit')
end

def guest_sign_up
  visit '/'
  click_button('Sign Up')
  fill_in :user_name, with: 'guesttestuser'
  fill_in :email, with: 'guestname@email.com'
  fill_in :password, with: '123456'
  fill_in :password_confirm, with: '123456'
  click_button('Create Account')
  end

  def guest_sign_in
    click_button 'Log Out'
    fill_in :user_name, with: 'guesttestuser'
    fill_in :password, with: '123456'
    click_button 'Sign In'
  end
