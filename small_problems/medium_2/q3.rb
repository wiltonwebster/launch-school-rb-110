# Lettercase Percentage Ratio

# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase 
# letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(input_string)
  selectors = {lowercase: 'a-z', uppercase: 'A-Z', neither: '^A-Za-z'}
  num_chars = input_string.length.to_f
  selectors.each_with_object({}) do |(type, selector), percentages|
    percentages[type] = (input_string.count(selector) / num_chars * 100).round(1)
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}