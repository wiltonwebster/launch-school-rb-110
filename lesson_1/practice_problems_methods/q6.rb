# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# The Array#pop method will destructively remove the last element of the
# provided array, but it will return the value of the element removed. Thus, the
# size method will be called on that element, which in this case is a string.
# The String#size method will return the number of characters in the string, 
# which in this case is 11, since 'caterpillar' will be the return value of pop.