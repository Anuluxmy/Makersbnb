feature 'Seeing a list of spaces' do

  scenario 'A signed in user can see a list of spaces' do
    sign_up
    sign_in
    create_space
    expect(page).to have_content 'test space'
  end

end
