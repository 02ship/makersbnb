require_relative "database_connection"

class Space
  attr_reader :name, :id, :description, :price, :userid
  def initialize(id:, name:, description:, price:, userid:, start_date:, end_date:)
    @name = name
    @id = id
    @description = description
    @price = price
    @userid = userid
    @start_date = start_date
    @end_date = end_date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map {|space| Space.new(
      id: space['id'].to_i, 
      name: space['name'], 
      description: space['description'], 
      price: space['price'], 
      userid: space['userid'], 
      start_date: space['start_date'], 
      end_date: space['end_date']
      )}
  end

  def self.create(name:, description:, price:, userid:, start_date:, end_date:)
    result = DatabaseConnection.query("INSERT INTO spaces(name, description, price, userid, start_date, end_date) VALUES('#{name}', '#{description}', '#{price}', '#{userid}', '#{start_date}', '#{end_date}') RETURNING *;")
    Space.new(
      id: result[0]['id'].to_i, 
      name: result[0]['name'], 
      description: result[0]['description'], 
      price: result[0]['price'], 
      userid: result[0]['userid'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date']
    )
  end
end
