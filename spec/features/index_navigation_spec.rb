feature 'Creating new space' do

  scenario 'A user can navigate from bookings to home' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button('List of Spaces')
    click_button('Book test space')
    fill_in :selected_date, with: '10/3/2019'
    click_button('Submit')
    click_button('Home')
    expect(page).to have_content 'Hello, testuser'
  end

  scenario 'A user can navigate from home to bookings' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button('List of Spaces')
    click_button('Book test space')
    fill_in :selected_date, with: '10/3/2019'
    click_button('Submit')
    click_button('Home')
    click_button('Booking Requests')
    expect(page).to have_content 'Bookings List'
  end

  scenario 'A user can navigate from home to approvals' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button('List of Spaces')
    click_button('Book test space')
    fill_in :selected_date, with: '10/3/2019'
    click_button('Submit')
    click_button('Home')
    click_button('Approvals')
    expect(page).to have_content 'Approvals List'
  end

  scenario 'A user can navigate from approvals to home' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button('List of Spaces')
    click_button('Book test space')
    fill_in :selected_date, with: '10/3/2019'
    click_button('Submit')
    click_button('Home')
    click_button('Approvals')
    click_button('Home')
    expect(page).to have_content 'Hello, testuser'
  end

  scenario 'A user can navigate from bookings to home' do
    sign_up
    sign_in
    create_space
    visit('/')
    click_button('List of Spaces')
    click_button('Home')
    expect(page).to have_content 'Hello, testuser'
    end
end
