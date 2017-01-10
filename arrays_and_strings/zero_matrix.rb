def zero_matrix(input)
  rows = []
  columns = []

  input.each_with_index do |line, line_i|
    if line.include? 0
      rows << line_i
      line.each_with_index { |el, el_i|  columns << el_i if el == 0 }
    end
  end

  input.each_with_index do |line, line_i|
    line.map! { |el| el = 0 } if rows.include? line_i
    line.each_index { |i| line[i] = 0 if columns.include? i }
  end

  input
end
