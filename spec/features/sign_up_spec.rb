feature 'signing up user' do
  scenario 'new user registered' do
    add_user
    expect(page).to have_content('You signed up!')
    result = DatabaseConnection.query("SELECT * FROM users;")
    expect(result[0]['name']).to eq("Ryan")
  end
end
