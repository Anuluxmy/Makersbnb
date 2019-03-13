feature 'approvals confirmation' do
scenario 'A user can navigate from home to approvals' do
  sign_up
  sign_in
  create_space
  visit('/')
  click_button('List of Spaces')
  click_button('Book test space')
  fill_in :day_guest, with: '2'
  page.select('January', :from => 'month_guest')
  click_button('Submit')
  click_button('Home')
  click_button('Approvals')
  expect(page).to have_content 'test space'
end
end
