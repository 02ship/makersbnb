require "space"

describe Space do

  describe "#initialize" do
    space = Space.new(1, "a space")
    it "has a name" do
      expect(space.name).to eq("a space")
    end
    it "has an id" do
      expect(space.id).to eq(1)
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
end
