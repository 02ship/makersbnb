require "database_connection"

class Space
  attr_reader :name, :id
  def initialize(id, name)
    @name = name
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map {|space| Space.new(space['id'].to_i, space['name'])}
  end

end
