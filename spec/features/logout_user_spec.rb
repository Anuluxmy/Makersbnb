feature 'Logging out' do
  scenario 'displays the homepage with no Hello, [username] message present' do
    sign_up
    click_button 'Log Out'

  end
end
