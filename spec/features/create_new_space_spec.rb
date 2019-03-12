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
    create_space
    expect(page).to have_content 'Here are the available spaces'
  end

end
