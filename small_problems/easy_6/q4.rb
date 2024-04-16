# Reversed Arrays (Part 1)

# Write a method that takes an Array as an argument, and reverses its elements 
# in place; that is, mutate the Array passed into this method. The return value
# should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(array)
  i = 0
  while i < array.size / 2
    array[i], array[-1-i] = array[-1-i], array[i]
  end
  array
end

list = []
p reverse!(list) == [] # true
p list == [] # true