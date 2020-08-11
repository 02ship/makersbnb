require_relative "database_connection"

class Space
  attr_reader :name, :id, :description
  def initialize(id:, name:, description:)
    @name = name
    @id = id
    @description = description
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map {|space| Space.new(id: space['id'].to_i, name: space['name'], description: space['description'])}
  end

  def self.create(name:, description:)
    result = DatabaseConnection.query("INSERT INTO spaces(name, description) VALUES('#{name}', '#{description}') RETURNING *;")
    Space.new(id: result[0]['id'].to_i, name: result[0]['name'], description: result[0]['description'])
  end

end
