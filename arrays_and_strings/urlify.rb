# write a method to replace all spaces in a stirng with '%20'.

def urlify(str)
  str.strip.gsub(" ", "%20")
end
