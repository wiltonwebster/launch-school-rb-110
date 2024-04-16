# Clean up the words

# Given a string that consists of some words (all lowercased) and an assortment
# of non-alphabetic characters, write a method that returns that string with all 
# of the non-alphabetic characters replaced by spaces. If one or more 
# non-alphabetic characters occur in a row, you should only have one space in 
# the result (the result should never have consecutive spaces).

def cleanup(input)
  clean_chars = []
  input.each_char do |char|
    if ('a'..'z').include?(char)
      clean_chars << char
    else
      clean_chars << ' '
    end
  end
  remove_double_spaces(clean_chars.join)
end

def remove_double_spaces(input)
  while input.include?('  ')
    input.sub!('  ', ' ')
  end
  input
end

p cleanup("---what's my +*& line?") == ' what s my line '