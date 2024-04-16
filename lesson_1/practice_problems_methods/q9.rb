# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# When called on a hash, the Enumeraable#map method will return an array of 
# values determined by the return value of each k-v pair being passed to the 
# provided block. In this block, the return value for a value whose size is 
# greater than 3 is the value itself, otherwise nil. Therefore the map method
# call should return the array: [nil, 'bear'].