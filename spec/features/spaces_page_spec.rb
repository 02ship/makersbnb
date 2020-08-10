feature 'Spaces page' do
  scenario 'User goes to spaces page, and sees list of spaces' do
    visit('/spaces')
    expect(page).to have_content('Spaces:')
  end
end
