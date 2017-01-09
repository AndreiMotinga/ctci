# There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.

# def one_away(first, second)
#   inter = first.chars & second.chars
#   first.size - inter.size <= 1
# end

def one_away(first, second)
  short, long = [first, second].sort_by(&:size)
  short.each_char { |el| long.slice! long.index(el) if long.index(el) }
  long.size <= 1
end
