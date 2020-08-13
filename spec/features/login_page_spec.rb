feature 'The login page' do
  scenario 'registered User logs in' do
    add_user
    visit('/sessions/new')
    fill_in :email, with: 'ryan@makers.com'
    fill_in :password, with: '123456'
    click_button 'Login'
    expect(page).to have_content('Hello, Ryan!')
  end

  scenario 'registered user inputs wrong' do
    add_user
    visit('/sessions/new')
    fill_in :email, with: 'wrong@makers.com'
    fill_in :password, with: '123456'
    click_button 'Login'
    expect(page).not_to have_content('Hello, Ryan!')
    expect(page).to have_content("Please check your email or password")
  end

end
