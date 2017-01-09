# check if a string has all unique characters.

def unique?(str)
  str.each_char { |char| return false if str.count(char) > 1 }
  true
end
