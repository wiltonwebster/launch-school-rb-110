# Given a positive integer n, return the largest integer you can make by 
# deleting one digit from n.

# Brute force method (creating all numbers and returning max).

def delete_digit(input)
  chars = input.to_s.chars
  missing_one_digit = []
  chars.each_index do |idx|
    subarray = chars[0...idx] + chars[(idx + 1)...(chars.size)]
    missing_one_digit << subarray.join.to_i
  end
  missing_one_digit.max
end

p delete_digit(791983) == 91983 # ==> true
p delete_digit(152) == 52 # ==> true
p delete_digit(1001) == 101 # ==> true
p delete_digit(10) == 1 # ==> true

p delete_digit(5)
p delete_digit(-10543)

# Mathematical method which finds the first occurrence of a digit being less 
# than the next digit, then removing that digit (else removing the last digit).

def alternative_delete_digit(input)
  digits = input.to_s.chars
  idx = 0
  loop do
    if idx == digits.size - 1
      digits.delete_at(idx)
      break
    elsif digits[idx] < digits[idx+1]
      digits.delete_at(idx)
      break
    end
    idx += 1
  end
  digits.join.to_i
end

p alternative_delete_digit(791983) == 91983
p alternative_delete_digit(152) == 52 # ==> true
p alternative_delete_digit(1001) == 101 # ==> true
p alternative_delete_digit(10) == 1
p alternative_delete_digit(5)