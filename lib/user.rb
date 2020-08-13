require_relative "database_connection"
require 'bcrypt'

class User
  attr_reader :email, :id, :name, :password
  def initialize(id:, email:, name:, password:)
    @name = name
    @id = id
    @email = email
    @password = password
  end

  def self.create(email:, name:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, name, password) VALUES('#{email}', '#{name}', '#{encrypted_password}') RETURNING *;")
    unencrypted_password = BCrypt::Password.new(result[0]['password'])
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], password: unencrypted_password)
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], password: result[0]['password'])
  end
end
