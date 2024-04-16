# What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# According to documentation for the Array#any? method:

# With a block given and no argument, calls the block with each element in self;
# returns true if the block returns any truthy value, false otherwise.

# Since the any? method is being passed a block and no argument, it will evaluate
# the block for each element in the array. On each iteration, the element will
# be output to the console, then the .odd? method will return true or false 
# based on the element's parity. Since the .odd? method is the last expression
# to be evaluated in the block, its return value will also be the block's return
# value. Since at least one element returns a truthy value for num.odd?, the
# any? method will return true in addition to outputting all 3 elements. 


# Correction: The .any? method uses short-circuiting logic and stops iterating
# after the first occurrence of the block returning a truthy value. Therefore
# the any? method retuns true, but only 1 is output to console before the method
# stops iterating. 