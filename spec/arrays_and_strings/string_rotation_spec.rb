require_relative "../../arrays_and_strings/string_rotation"

describe "#string_rotation" do
  it "returns true when string is rotation of other string" do
    expect(string_rotation("waterbottle", "erbottlewat")).to eq true
  end

  it "returns true when string is rotation of other string" do
    expect(string_rotation("buzzword", "wordbuzz")).to eq true
  end

  it "returns false when string isn't rotation of other string" do
    expect(string_rotation("foo", "bar")).to eq false
  end

  it "returns false when string isn't rotation of other string" do
    expect(string_rotation("foo", "foo")).to eq false
  end
end
