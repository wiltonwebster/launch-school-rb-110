# Write a method that takes an Array of numbers, and returns an Array with the 
# same number of elements, and each element has the running total from the 
# original Array.

def running_total(arr)
  curr_total = 0
  arr.each_with_object([]) do |num, ary|
    curr_total += num
    ary << curr_total
  end
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Solution points out that we should be using map for this transformation.

