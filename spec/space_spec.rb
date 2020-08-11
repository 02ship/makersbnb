require "space"

describe Space do
  
  describe "#initialize" do
    it "has a name" do
      space = Space.new("a space")
      expect(space.name).to eq("a space")
    end
  end
end