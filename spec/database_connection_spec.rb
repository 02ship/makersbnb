require 'database_connection'
describe DatabaseConnection do
  it 'establishes a connection to the database' do
    expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
    DatabaseConnection.setup('makersbnb_test')
  end
  it 'queries the database' do
    connection = DatabaseConnection.setup('makersbnb_test')
    expect(connection).to receive(:exec).with("SELECT * FROM spaces;")
    DatabaseConnection.query("SELECT * FROM spaces;")
  end
end
