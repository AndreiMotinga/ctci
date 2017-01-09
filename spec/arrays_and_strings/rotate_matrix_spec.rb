require_relative "../../arrays_and_strings/rotate_matrix"

describe "#rotate_matrix" do
  it "rotates matrix" do
    old_matrix = [%w(1 2 3),
                  %w(4 5 6),
                  %w(7 8 9)]
    new_matrix = [%w(7 4 1),
                  %w(8 5 2),
                  %w(9 6 3)]

    expect(rotate_matrix(old_matrix)).to eq new_matrix
  end
end
