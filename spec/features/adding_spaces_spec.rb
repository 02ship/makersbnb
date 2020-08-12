feature 'in add spaces page' do
  scenario 'add space' do
    visit('/spaces/add')
    fill_in :name, with: 'Room_1'
    fill_in :description, with: 'Description_1'
    fill_in :price, with: 50
    click_button 'Add'
    expect(page).to have_content('Room_1')
    expect(page).to have_content('Description_1')
    expect(page).to have_content('50')
  end
end
