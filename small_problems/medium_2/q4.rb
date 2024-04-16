# Matching Parentheses?

# Write a method that takes a string as an argument, and returns true if all 
# parentheses in the string are properly balanced, false otherwise. To be 
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

def balanced?(input_string)
  paren_counter = 0
  input_string.chars.each do |char|
    if char == '('
      paren_counter += 1
    elsif char == ')'
      paren_counter -= 1
    end
    break if paren_counter < 0
  end
  paren_counter == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false