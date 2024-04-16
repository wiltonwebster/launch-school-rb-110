# How Many

# Write a method that counts the number of occurrences of each element in a 
# given array.

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print
# each element alongside the number of occurrences.

def count_occurrences(list)
  count = Hash.new(0)
  list.each { |item| count[item.downcase] += 1 }
  count.each { |key, value| puts("#{key} => #{value}") }
end

vehicles = [
  'car', 'car', 'truck', 'Car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)