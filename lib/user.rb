require_relative "database_connection"

class User
  attr_reader :email, :id, :name, :password
  def initialize(id:, email:, name:, password:)
    @name = name
    @id = id
    @email = email
    @password = password
  end

  def self.create(email:, name:, password:)
    result = DatabaseConnection.query("INSERT INTO users (email, name, password) VALUES('#{email}', '#{name}', '#{password}') RETURNING *;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], password: result[0]['password'])
  end
end
