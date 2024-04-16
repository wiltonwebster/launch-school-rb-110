# Grocery List

# Write a method which takes a grocery list (array) of fruits with quantities 
# and converts it into an array of the correct number of each fruit.

def buy_fruit(list)
  result = []
  list.each do |item| 
    name = item[0]
    quantity = item[1]
    quantity.times { result << name }
  end
  result
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]