require_relative "../../arrays_and_strings/zero_matrix"

describe "#zero_matrix" do
  it "sets rows and columns containing 0 to zeros" do
    input = [[1, 2, 3],
             [1, 0, 1],
             [1, 1, 1]]

    result = [[1, 0, 3],
              [0, 0, 0],
              [1, 0, 1]]

    expect(zero_matrix(input)).to eq result
  end
end
