# The String#to_i method converts a string of numeric characters (including an 
# optional plus or minus sign) to an Integer. String#to_i and the Integer 
# constructor (Integer()) behave similarly. In this exercise, you will create a 
# method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about 
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to
# convert a string to a number, such as String#to_i, Integer(), etc. Your method
# should do this the old-fashioned way and calculate the result by analyzing the 
# characters in the string.

DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def string_to_integer(str)
  digit_arr = str.chars.map { |char| DIGITS[char] }
  number = 0
  digit_arr.each_with_index do |digit, idx| 
    number += digit * (10 ** (digit_arr.size - 1 - idx))
  end
  number
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

def hexadecimal_to_integer(str)
  digit_arr = str.chars.map { |char| DIGITS[char] }
  number = 0
  digit_arr.each_with_index do |digit, idx| 
    number += digit * (16 ** (digit_arr.size - 1 - idx))
  end
  number
end


p hexadecimal_to_integer('4D9F') == 19871