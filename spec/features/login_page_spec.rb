feature 'The login page' do
  scenario 'User goes to the login page' do
    add_user
    visit('/sessions/new')
    fill_in :email, with: 'ryan@makers.com'
    fill_in :password, with: '123456'
    click_button 'Login'
    expect(page).to have_content('Hello, Ryan!')
  end

end
