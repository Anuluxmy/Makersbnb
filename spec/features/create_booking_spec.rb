feature 'creates a booking' do
  scenario 'A signed in user can see a list of booking' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button 'Log Out'
    guest_sign_up
    guest_sign_in
    click_button('List of Spaces')
    expect(page).to have_content('test space')
    # click_button('Book test space')
    #update and complete test
  end

  scenario 'Guest can make a booking' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button 'Log Out'
    guest_sign_up
    guest_sign_in
    click_button('List of Spaces')
    click_button('Book test space')
    expect(page).to have_content('Select preferred dates')
    fill_in :day_guest, with: '2'
    page.select('January', :from => 'month_guest')
    
  end

end
