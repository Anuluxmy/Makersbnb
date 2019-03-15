feature 'approvals confirmation' do
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
  expect(page).to have_content 'test space'
end

  scenario "A booking can be approved by the space's owner" do
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

    click_button('Approve Now')
    expect(page).to have_content('approved')
  end
end
