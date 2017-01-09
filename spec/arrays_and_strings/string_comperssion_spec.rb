require_relative "../../arrays_and_strings/string_compression"

describe StringCompression do
  describe "#compressed" do
    it "compresses the string" do
      expect(StringCompression.new("aabcccccaaa").compressed).to eq "a2b1c5a3"
    end

    context "when compressed string is longer than original" do
      it "returns original" do
        expect(StringCompression.new("abca").compressed).to eq "abca"
      end
    end
  end
end
