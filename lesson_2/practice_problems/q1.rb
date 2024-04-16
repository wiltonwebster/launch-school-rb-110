arr = ['10', '11', '9', '7', '8']

# How would you order this array of number strings by descending numeric value?

def descending_order_numeric_strings(array)
  array.sort { |a, b| b.to_i <=> a.to_i }
end

p descending_order_numeric_strings(arr)