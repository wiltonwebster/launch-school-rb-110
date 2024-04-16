# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# The Array#select method returns a new array by filtering the elements of the
# calling array based on the truthiness value of each element being passed as
# the parameter to the select method's block. The block will return the value
# of the last expression evaluated, which in this snippet is the string literal
# 'hi'. Since string literals always evaluate as true, the select method will 
# return a new array object with all elements selected: [1, 2, 3]
