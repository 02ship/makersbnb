require_relative "database_connection"

class Space
  attr_reader :name, :id, :description, :price
  def initialize(id:, name:, description:, price:)
    @name = name
    @id = id
    @description = description
    @price = price
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map {|space| Space.new(id: space['id'].to_i, name: space['name'], description: space['description'], price: space['price'])}
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO spaces(name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING *;")
    Space.new(id: result[0]['id'].to_i, name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

end
