# All Substrings

# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means 
# that all substrings that start at position 0 should come first, then all 
# substrings that start at position 1, and so on. Since multiple substrings will 
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the 
# previous exercise.

def leading_substrings(input_string)
  substrings = []
  (0...input_string.length).each do |letter| 
    substrings << input_string.slice(0..letter)
  end
  substrings
end

def all_substrings(input_string)
  all_substrings = []
  len = input_string.length
  (0...len).each do |idx|
    all_substrings << leading_substrings(input_string.slice(idx...len))
  end
  all_substrings.flatten
end

p all_substrings('abcde')  == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]