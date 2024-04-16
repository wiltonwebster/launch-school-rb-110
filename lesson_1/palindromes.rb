def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

def substrings(str)
  last_index = str.length - 1
  substring_array = []
  for i in (0...last_index) do
    for j in (i+1..last_index) do
      substring_array << str.slice(i..j)
    end
  end
  substring_array
end

def is_palindrome?(str)
  (str == str.reverse)
end

p palindrome_substrings("abcddcbA") # ["bcddcb", "cddc", "dd"]