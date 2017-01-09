require_relative "../../arrays_and_strings/string_compression"

describe "#string_compression" do
  it "compresses the string" do
    expect(string_compression("aabcccccaaa")).to eq "a2b1c5a3"
  end

  context "when compressed string is longer than original" do
    it "returns original" do
      expect(string_compression("abca")).to eq "abca"
    end
  end
end
