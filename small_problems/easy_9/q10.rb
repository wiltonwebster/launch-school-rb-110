# Sum of Digits

# Write a method that takes one argument, a positive integer, and returns the 
# sum of its digits.

def digit_sum(number)
  number.to_s.chars.map(&:to_i).inject(:+)
end

p digit_sum(23)