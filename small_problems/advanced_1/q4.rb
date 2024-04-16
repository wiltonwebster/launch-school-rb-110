# Transpose MxN Matrix

def transpose(mat_mxn)
  num_columns = mat_mxn[0].size
  result = []
  num_columns.times do |idx|
    result << mat_mxn.map { |row| row[idx] }
  end
  result
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]