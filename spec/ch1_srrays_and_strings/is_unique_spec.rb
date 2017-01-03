require_relative "../../ch1_arrays_and_strings/is_unique"

describe "unique?" do
  it "returns true when characters are uniq" do
    expect(unique?("foo")).to eq true
  end
end
