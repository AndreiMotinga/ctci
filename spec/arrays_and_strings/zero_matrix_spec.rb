require_relative "../../arrays_and_strings/zero_matrix"

describe Matrix do
  describe "#zero" do
    it "sets rows and columns containing 0 to zeros" do
      input = [[1, 2, 3],
               [1, 0, 1],
               [1, 1, 1]]

      result = [[1, 0, 3],
                [0, 0, 0],
                [1, 0, 1]]

      expect(Matrix.new(input).zero).to eq result
    end
  end

  describe "#zero" do
    it "sets rows and columns containing 0 to zeros" do
      input = [[0, 2, 3],
               [1, 0, 1],
               [1, 1, 1]]

      result = [[0, 0, 0],
                [0, 0, 0],
                [0, 0, 1]]

      expect(Matrix.new(input).zero).to eq result
    end
  end
end
