require_relative "../../arrays_and_strings/urlify"

describe "urlify" do
  it "replaces spaces with %20" do
    expect(urlify("Mr John Smith   ")).to eq "Mr%20John%20Smith"
  end
end
