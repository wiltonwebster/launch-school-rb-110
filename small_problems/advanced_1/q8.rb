# Merge Sort

# Sort an array of passed in values using merge sort. You can assume that this 
# array may contain only one type of data. And that data may be either all 
# numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the 
# array elements into nested sub-arrays, then recombining those nested 
# sub-arrays in sorted order. It is best shown by example. For instance, let's 
# merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we 
# get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested 
# sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

def merge(arr1, arr2)
  merged_arr = []
  counter1, counter2 = [0,0]
  loop do
    break if counter1 == arr1.size || counter2 == arr2.size
    if arr1[counter1] < arr2[counter2]
      merged_arr << arr1[counter1]
      counter1 += 1
    else
      merged_arr << arr2[counter2]
      counter2 += 1
    end
  end
  if counter1 < arr1.size
    merged_arr + arr1[counter1..arr1.size-1]
  else
    merged_arr + arr2[counter2..arr2.size-1]
  end
end

def merge_sort(arr)
  recursive_split(arr)
end

def recursive_split(arr)
  return arr if arr.size < 2
  middle = arr.size / 2
  [recursive_split(arr[0, middle]), recursive_split(arr[middle, middle+1])]
end

arr = [1, 2, 4, 6, 7]

p recursive_split(arr)

# gave up