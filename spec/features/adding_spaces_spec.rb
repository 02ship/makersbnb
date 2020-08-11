feature 'in add spaces page' do
  scenario 'add space' do
    visit('/add')
    fill_in :room, with: 'Room_1'
    click_button 'Add'
    expect('/spaces').to have_content('Room_1')
  end
end
