
class Date
  attr_reader :date, :id
  def initialize(id:, date:)
    @id = id
    @date = date

  end

  def self.create(date:)
    result = DatabaseConnection.query("INSERT INTO dates(date) VALUES('#{date}') RETURNING *;")
    Date.new(id: result[0]['id'], date: result[0]['date'])
  end

  def self.available_dates(query)
    DatabaseConnection.query(query)
  end

end
