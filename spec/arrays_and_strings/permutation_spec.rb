require_relative "../../arrays_and_strings/permutation"

describe "#permutation" do
  it "returns true when second is permutation of first" do
    expect(permutation?("qwerty", "qertyw")).to eq true
  end

  it "returns false when second is not permutation of first" do
    expect(permutation?("qwerty", "andrei")).to be_falsey
  end
end

describe "#permutations" do
  it "returns all permutations of a string" do
    string = "ABC"
    expected = %w(
      ABC
      ACB
      BAC
      BCA
      CBA
      CAB
    )

    expect(permutations(string)).to match_array(expected)
  end
end
