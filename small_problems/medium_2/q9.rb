# Bubble Sort

# Bubble Sort is one of the simplest sorting algorithms available. It isn't an 
# efficient algorithm, but it's a great exercise for student developers. In this 
# exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array. 
# On each pass, each pair of consecutive elements is compared. If the first of 
# the two elements is greater than the second, then the two elements are 
# swapped. This process is repeated until a complete pass is made without 
# performing any swaps; at that point, the Array is completely sorted.

def bubble_sort!(arr)
  loop do 
    changes_made = false
    (arr.size - 1).times do |idx|
      if arr[idx] > arr[idx+1]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        changes_made = true
      end
    end
    break unless changes_made
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)