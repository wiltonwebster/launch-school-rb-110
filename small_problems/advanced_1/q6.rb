# Fix the Bug

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# The code is expected to print:

# []
# [21]
# [9, 16]
# [25, 36, 49]

# However, it does not. Obviously, there is a bug. Find and fix the bug, then 
# explain why the buggy program printed the results it did.

# There is no condition listed on line 6 after the elsif, so the program is 
# interpreting lines 7 through 9 as the condition to evaluate. Since that block
# returns a truthy value if it executes on an array, all array inputs which are 
# non-empty will attempt to execute the elsif statement. Since no statement is
# provided after the condition, the return value is nil. This could be fixed by
# inserting a condition on line 6. Presumably the condition should be if the 
# input array has at least 2 elements.