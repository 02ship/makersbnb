require_relative "database_connection"

class Space
  attr_reader :name, :id, :description, :price, :userid
  def initialize(id:, name:, description:, price:, userid:)
    @name = name
    @id = id
    @description = description
    @price = price
    @userid = userid
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map {|space| Space.new(id: space['id'].to_i, name: space['name'], description: space['description'], price: space['price'], userid: space['userid'])}
  end

  def self.create(name:, description:, price:, userid:)
    result = DatabaseConnection.query("INSERT INTO spaces(name, description, price, userid) VALUES('#{name}', '#{description}', '#{price}', '#{userid}') RETURNING *;")
    Space.new(id: result[0]['id'].to_i, name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], userid: result[0]['userid'])
  end
end
