# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by 
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby, such
# as Integer#to_s, String(), Kernel#format, etc. You may, however, use 
# integer_to_string from the previous exercise.

STRING_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(num)
  if num < 0 
    sign = '-'
    num *= -1
  elsif num > 0
    sign = '+'
  else
    sign = ''
  end
  
  digits= []
  loop do 
    num, trailing_digit = num.divmod(10)
    digits.unshift(trailing_digit)
    break if num == 0
  end
  str = digits.map { |digit| STRING_DIGITS[digit] }.join
  
  str.prepend(sign)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'