def even_subs(arr)
  even_sums = []
  all_subarrays = create_all_subarrays(arr)
  even_sums = all_subarrays.select { |sub_arr| sub_arr.sum.even? }
  even_sums.uniq
end

def create_all_subarrays(arr)
  subarrays = []
  arr.each_with_index do |_, start_index|
    (start_index...arr.size).each do |end_index|
      subarrays << arr[start_index..end_index]
    end
  end
  subarrays
end

p even_subs([1, 1, 1, 1, 1]).sort == [[1, 1], [1, 1, 1, 1]]
p even_subs([1, 2, 3, 4, 5]).sort == [[1, 2, 3], [1, 2, 3, 4], [2], [2, 3, 4, 5], [3, 4, 5], [4]]
p even_subs([88, 54, 67, 56, 36]).sort == [[36], [54], [56], [56, 36], [88], [88, 54]]
p even_subs([]) == []

# All return true