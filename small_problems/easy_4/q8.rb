# In the previous exercise, you developed a method that converts simple numeric 
# strings to Integers. In this exercise, you're going to extend that method to 
# work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate 
# number as an integer. The String may have a leading + or - sign; if the first 
# character is a +, your method should return a positive number; if it is a -, 
# your method should return a negative number. If no sign is given, you should 
# return a positive number.


DIGITS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15,
  '-' => '-', '+' => '+'
}

def string_to_signed_integer(str)
  digit_arr = str.chars.map { |char| DIGITS[char] }
  sign = 1
  number = 0
  
  if digit_arr[0] == '+'
    digit_arr.shift
  elsif digit_arr[0] == '-'
    digit_arr.shift
    sign = -1
  end
  
  digit_arr.each_with_index do |digit, idx| 
    number += digit * (10 ** (digit_arr.size - 1 - idx))
  end
  number * sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

