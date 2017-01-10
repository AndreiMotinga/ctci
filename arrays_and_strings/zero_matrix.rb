# Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.

class Matrix
  attr_reader :matrix

  def initialize(input)
    @matrix = input
  end

  def zero
    zero = matrix.map(&:dup)
    zero.each_with_index do |line, line_i|
      line.map! { |el| el = 0 } if rows_with_zero.include? line_i
      line.each_index { |i| line[i] = 0 if columns_with_zero.include? i }
    end
  end

  private

  def columns_with_zero
    columns = []
    matrix.each_with_index do |line, line_i|
      line.each_with_index { |el, el_i|  columns << el_i if el == 0 }
    end
    columns
  end

  def rows_with_zero
    rows = []
    matrix.each_with_index { |line, i| rows << i if line.include? 0 }
    rows
  end
end
