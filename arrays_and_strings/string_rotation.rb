# String Rotation: Assume you have a method is_substring which checks if one word is a subscring of another. Given two string, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to is_substring (e.g "waterbottle" is a rotation of "erbottlewat")

# def string_rotation(left, right)
#   return false if left == right
#   str = left
#   left.size.times do
#     return true if str == right
#     str << str.slice!(0)
#   end
#   false
# end

def is_substring?(str, sub)
  str[sub] == sub
end

def string_rotation(left, right)
  return false if left == right
  str = right + right
  is_substring?(str, left)
end
