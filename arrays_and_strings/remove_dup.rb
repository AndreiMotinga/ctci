# remove duplicate characters without using additional data structures.

def remove_dup(str)
  i = 0
  while i < str.length - 1
    j = i + 1
    while j < str.length
      str[i] == str[j] ? str[j] = "" : j += 1
    end
    i += 1
  end
  str
end
