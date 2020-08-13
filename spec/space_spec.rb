require "space"

describe Space do

  describe "#initialize" do
    space = Space.new(id: 1, name: "a space", description: 'a nice place to stay', price: 1, userid: 1)
    it "has a name" do
      expect(space.name).to eq("a space")
    end
    it "has an id" do
      expect(space.id).to eq(1)
    end
    it 'has a description' do
      expect(space.description).to eq('a nice place to stay')
    end
    it 'has a price' do
      expect(space.price).to eq(1)
    end
  end

  describe ".all" do
    it "return all spaces in spaces table" do
      DatabaseConnection.query("INSERT INTO spaces(name) VALUES('a space'), ('another space');")

      expect(Space.all[0]).to be_an_instance_of(Space)
      expect(Space.all[0].name).to eq("a space")
      expect(Space.all.length).to eq(2)
      expect(Space.all[0].id).to eq(1)
    end
  end

  describe ".create" do
    it "pulls from the database to create a new Space" do
      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
      space = Space.create(name: 'another space', description: 'another nice place to stay', price: 1, userid: user.id)
      result = Space.all
      expect(space.id).to eq(result.first.id)
      expect(space.name).to eq(result.first.name)
      expect(space.description).to eq(result.first.description)
      expect(space.price).to eq(result.first.price)
    end
  end
end
