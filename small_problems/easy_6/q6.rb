# Combining Arrays

# Write a method that takes two Arrays as arguments, and returns an Array that 
# contains all of the values from the argument Arrays. There should be no 
# duplication of values in the returned Array, even if there are duplicates in 
# the original Arrays.

def merge(ary1, ary2)
  ary1.concat(ary2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# Alternative definition:

def merge(ary1, ary2)
  ary1 | ary2
end