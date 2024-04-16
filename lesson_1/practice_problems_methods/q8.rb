# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# According to documentation for the Array#take method:

# Returns a new Array containing the first n element of self, where n is a 
# non-negative Integer; does not modify self.

# From this we can conclude that arr will not be affected, and arr.take(2) will
# return a new array with the first two elements of arr: [1, 2].