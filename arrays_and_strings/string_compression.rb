def count_chars(str, curr = "", index = 0, data = {})
  str.each_char do |char|
    if curr != char
      curr = char # update curr
      index += 1
      data[index] = {}
      data[index][curr] = 1 # create new char
    else
      data[index][curr] += 1
    end
  end
  data
end

def string_compression(str)
  data = count_chars(str)
  compressed = data.values.map{|v| "#{v.keys[0]}#{v.values[0]}"}.join
  str.size < compressed.size ? str : compressed
end
