require_relative "../../ch1_arrays_and_strings/is_unique"

describe "unique?" do
  it "returns true when characters are uniq" do
    expect(unique?("qwerty")).to eq true
  end

  it "returns false when characters aren't uniq" do
    expect(unique?("yqwerty")).to eq false
  end
end
