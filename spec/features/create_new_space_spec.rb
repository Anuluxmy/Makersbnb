feature 'Creating new space' do

  scenario 'A signed in user can access the create space page' do
    sign_up
    sign_in
    click_button('List of Spaces')
    click_button('Create Space')
    expect(page).to have_content 'Please fill in this form'
  end

  scenario 'A signed in user can create a new space' do
    sign_up
    sign_in
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
    expect(page).to have_content 'Here are the available spaces'
  end

end
