require_relative "database_connection"
require 'bcrypt'

class User
  attr_reader :email, :id, :name
  def initialize(id:, email:, name:)
    @name = name
    @id = id
    @email = email
  end

  def self.create(email:, name:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, name, password) VALUES('#{email}', '#{name}', '#{encrypted_password}') RETURNING *;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return nil unless result.any?
    return nil unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def spaces
    spaces = DatabaseConnection.query("SELECT * FROM spaces WHERE userid = '#{@id}';")
    spaces.map {|space| Space.new(id: space['id'].to_i, name: space['name'], description: space['description'], price: space['price'], userid: space['userid'])}
  end
end
