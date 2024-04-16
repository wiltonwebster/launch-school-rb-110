# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# The Array#map method will return a new array whose elements are the return
# values of the provided block, when each element of the original array is 
# passed through it. In this provided block, if the element is greater than 1, 
# the value is output to console and the block returns nil. Otherwise, the block
# simply returns the value it was passed. Therefore, 1 maps to 1, but 2 and 3 
# are output, then mapped to nil. So 2 and 3 will be printed in the console, and
# the new array created by map will be [1, nil, nil].