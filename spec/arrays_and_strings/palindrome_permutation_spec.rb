require_relative "../../arrays_and_strings/palindrome_permutation"

describe "#palindrome_permutation" do
  it "returns true if string is palindrome permutation" do
    result = PalindromePermutation.new("Tact Coa").palindrome?
    expect(result).to eq true
  end

  it "returns true if string is palindrome permutation" do
    result = PalindromePermutation.new("TactapdCoadpa").palindrome?
    expect(result).to eq true
  end

  it "returns false when string is not palindrome permutation" do
    result = PalindromePermutation.new("Andrei").palindrome?
    expect(result).to be_falsey
  end
end
