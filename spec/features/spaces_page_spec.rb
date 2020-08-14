feature 'Spaces page' do
  scenario 'User goes to spaces page, and sees list of spaces' do
    DatabaseConnection.query("INSERT INTO spaces(name, description, price) VALUES('Room_1', 'Description_1', '50');")
    visit('/spaces')
    expect(page).to have_content('Spaces:')
    expect(page).to have_content('Room_1')
    expect(page).to have_content('Description_1')
  end
end
