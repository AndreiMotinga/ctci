require_relative "../../arrays_and_strings/permutation"

describe "#permutation" do
  it "returns true when second is permutation of first" do
    expect(permutation?("qwerty", "qertyw")).to eq true
  end

  it "returns false when second is not permutation of first" do
    expect(permutation?("qwerty", "andrei")).to be_falsey
  end
end
