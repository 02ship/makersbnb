def setup_test_database
  p "setting up test database..."
  DatabaseConnection.setup('makersbnb_test')
  DatabaseConnection.query("TRUNCATE TABLE spaces RESTART IDENTITY;")
  DatabaseConnection.query("TRUNCATE TABLE users RESTART IDENTITY;")
end
