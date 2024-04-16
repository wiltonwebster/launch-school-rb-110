# Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are 
# palindromic. That is, each substring must consist of the same sequence of 
# characters forwards as it does backwards. The return value should be arranged 
# in the same sequence as the substrings appear in the string. Duplicate 
# palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous 
# exercise.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor 
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

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

def palindromes(input_string)
  all_substrings(input_string).select { |substring| palindrome?(substring) }
end

def palindrome?(input_string)
  input_string == input_string.reverse && input_string.length > 1 
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]