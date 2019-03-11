feature 'Landing page' do
  scenario 'landing page is up and available' do
    visit '/'
    expect(page).to have_content 'Welcome to Makers BnB'
  end
end
