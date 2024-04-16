# Double Char (Part 1)

# Write a method that takes a string, and returns a new string in which every 
# character is doubled.

def repeater(string)
  result = ''
  string.each_char { |char| result << char << char }
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''