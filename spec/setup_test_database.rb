def setup_test_database
  p "setting up test database..."
  DatabaseConnection.setup('makersbnb_test')
  DatabaseConnection.query("TRUNCATE TABLE spaces, users, dates, spaces_dates RESTART IDENTITY;")
end
