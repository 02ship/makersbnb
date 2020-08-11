feature 'in add spaces page' do
  scenario 'add space' do
    visit('/spaces/add')
    fill_in :name, with: 'Room_1'
    expect(page).to have_field('name')
    


  end
end
