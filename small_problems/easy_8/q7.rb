# Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every 
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, 
# and whitespace should not be doubled.

def double_consonants(string)
  result = ''
  string.each_char do |char| 
    if char =~ /[a-z&&[^aeiou]]/i
      result << char << char
    else 
      result << char
    end
  end
  result
end

p double_consonants("July 4th") == "JJullyy 4tthh"