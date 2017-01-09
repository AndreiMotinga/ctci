require_relative "../../arrays_and_strings/remove_dup"

describe "#remove_dup" do
  context "all characters are uniq" do
    it "doesn't modify string" do
      expect(remove_dup("qwerty")).to eq "qwerty"
    end

    it "doesn't modify string" do
      expect(remove_dup("andrei")).to eq "andrei"
    end
  end

  it "removes duplicated characters" do
    expect(remove_dup("qqwerty")).to eq "qwerty"
  end

  it "removes duplicated characters" do
    expect(remove_dup("qqwertyyy")).to eq "qwerty"
  end

  it "removes duplicated characters" do
    expect(remove_dup("111112223334")).to eq "1234"
  end
end
