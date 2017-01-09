# rotate matrix: given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees.
# TODO: Can you do it in place?

def rotate_matrix(old_matrix)
  new_matrix = old_matrix.map(&:dup)
  old_matrix.each_with_index do |line, line_i|
    line.each_with_index do |el, el_i|
      new_matrix[el_i][-(line_i + 1)] = el
    end
  end
  new_matrix
end
