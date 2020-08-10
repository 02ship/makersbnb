feature 'Home page' do
  scenario 'User visits /, sees homepage' do
    visit('/')
    expect(page).to have_content('MakersBnB')
  end
end
