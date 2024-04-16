# Word to Digit

# Write a method that takes a sentence string as input, and returns the same 
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

DIGIT_WORDS = %w(zero one two three four five six seven eight nine)

def word_to_digit(input_string)
  string = input_string.clone
  DIGIT_WORDS.each do |digit|
    string.gsub!(digit, DIGIT_WORDS.index(digit).to_s)
  end
  string
end

message = 'Please call me at five five five one two three four. Thanks.'

p word_to_digit(message) # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

p message