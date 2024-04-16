# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# Looking at the documentation for Array#count, we find this:

# With no argument and a block given, calls the block with each element; returns
# the count of elements for which the block returns a truthy value.

# The block returns a truthy value for 2 of the 3 elements passed to it, so the
# method returns the integer 2.