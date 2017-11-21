# Given two strings, write a method to decide if one is a permutation of the other

def permutation?(first, second)
  first.chars.sort == second.chars.sort
end

# return all permutations of a string
def permutations(str)
end
