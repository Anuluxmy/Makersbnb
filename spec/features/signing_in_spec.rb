feature 'Signing-in' do
  scenario 'signs in and shows username at top of index page' do
    sign_up
    sign_in
    expect(page).to have_content 'Hello, testuser'
  end
end
