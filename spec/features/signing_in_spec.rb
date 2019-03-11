feature 'Signing-in' do
  scenario 'signs in and shows username at top of index page' do
    visit '/'
    fill_in :user_name, with: 'testuser'
    fill_in :password, with: '123456'
    click_button 'Sign In'
    expect(page).to have_content 'hello, testuser'
  end
end
