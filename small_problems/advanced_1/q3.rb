# Transpose 3x3 Matrix

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(mat_3x3)
  result = []
  3.times do |idx|
    result << mat_3x3.map { |row| row[idx] }
  end
  result
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]