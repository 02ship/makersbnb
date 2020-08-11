require "space"

describe Space do

  describe "#initialize" do
    it "has a name" do
      space = Space.new("a space")
      expect(space.name).to eq("a space")
    end
  end

  describe ".all" do
    it "return all spaces in spaces table" do
      DatabaseConnection.setup('makersbnb_test')
      DatabaseConnection.query("INSERT INTO spaces(name) VALUES('a space'), ('another space');")

      expect(Space.all).to include("a space")
      expect(Space.all).to include("another space")

      # expect(Space.all[0]).to be_an_instance_of(Space)
      # expect(Space.all[0].name).to be("a space")

    end
  end
end
