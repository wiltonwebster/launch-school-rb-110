# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

# The Array#each_with_object method allows us to pass an object to the each 
# method when we call it on an array. In this case, the object we've passed in
# is an empty hash, which we have assigned to the parameter variable called 
# hash. The parameter variable value is assigned each element of the array, and
# in each iteration, the first character of the string assigned to value is 
# created as a key in the hash, mapping to the element's value. For instance, on
# the first iteration of each, the string 'a' is mapped in the hash to the 
# string 'ant'. The each_with_object method then returns the object that was 
# passed to it (in this case, the hash that we have filled with 3 k-v pairs).