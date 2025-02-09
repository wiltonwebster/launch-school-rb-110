# Given the following data structure use a combination of methods, including 
# either the select or reject method, to return a new array identical in 
# structure to the original but containing only the integers that are multiples 
# of 3.

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map { |sub_arr| sub_arr.select { |elem| elem % 3 == 0 } }


p new_arr == [[], [3, 12], [9], [15]]