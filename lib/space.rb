require "database_connection"

class Space
  attr_reader :name, :id
  def initialize(id:, name:)
    @name = name
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map {|space| Space.new(id: space['id'].to_i, name: space['name'])}
  end

  def self.create(name:)
    result = DatabaseConnection.query("INSERT INTO spaces(name) VALUES('#{name}') RETURNING id, name;")
    Space.new(id: result[0]['id'].to_i, name: result[0]['name'])
  end

end
