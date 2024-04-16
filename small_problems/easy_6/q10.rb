# Mutation

# What will the following code print, and why? Don't run the code until you have
# tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# The output will have Curly, Shemp, and Chico in all caps. The .each method on
# line 8 which appends all the values from array1 to array2 is not passing 
# copies of the values in array1. It is passing references to the string objects
# themselves. Thus, after line 8 is complete, array1 and array2 are two different
# array objects pointing at the same collection of string objects. When the 
# string objects are mutated on line 9, both arrays now point to the same set of
# strings, but the strings starting with 'S' and 'C' have been mutated to upper
# case strings. 