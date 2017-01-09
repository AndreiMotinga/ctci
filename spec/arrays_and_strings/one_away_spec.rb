require_relative "../../arrays_and_strings/one_away"

describe "one_away" do
  context "when one permutation away" do
    it "returns true" do
      expect(one_away("pale", "ple")).to eq true
    end

    it "returns true" do
      expect(one_away("pales", "pale")).to eq true
    end

    it "returns true" do
      expect(one_away("pale", "bale")).to eq true
    end
  end

  context "when more than one permutation away" do
    it "returns false" do
      expect(one_away("pale", "bake")).to eq false
    end
  end
end
