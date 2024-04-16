# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# According to documentation, Array#reject is essentially the opposite of 
# Array#select. Like select, the reject method will return a new array filtered
# based on the return value of the provided block. However, while select returns
# an array whose elements cause the block to evaluate as true, the reject method
# returns an array whose elements cause the block to evaluate as false. In this
# case, the return value of the block will always by nil, which is falsy. Thus,
# reject method will return a new array of [1, 2, 3].