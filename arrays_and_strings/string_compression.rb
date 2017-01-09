class StringCompression
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def compressed
    str.size < compressed_string.size ? str : compressed_string
  end

  private

  def compressed_string
    characters_count.map { |v| "#{v.keys[0]}#{v.values[0]}" }.join
  end

  def characters_count
    curr = ""
    index = 0
    str.each_char.each_with_object({}) do |char, data|
      next data[index][curr] += 1 if curr == char
      curr = char
      index += 1
      data[index] = {}
      data[index][curr] = 1
    end.values
  end
end
