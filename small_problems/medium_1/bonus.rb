# The fibonacci_last method from q10 works well for a while, but even that
# method cannot handle 15+ digit numbers. Write a method that can output the 
# last digit of the nth fibonacci number for any arbitrarily large n. 

# This method therefore should not scale in complexity or number of calculations
# with n. 

def fibonacci_last(n)
  return 0 if n < 1
  return 1 if n == 1 || n == 2
  first_digit = 1
  second_digit = 1
  curr_digit = 0
  counter = 2
  until counter >= n
    curr_digit = (first_digit + second_digit) % 10
    first_digit, second_digit = second_digit, curr_digit
    counter += 1
  end
  curr_digit
end

def fib_last_digits(max)
  1.upto(max).map do |num|
    fibonacci_last(num)
  end
end

def fast_fibonacci_last(n)
  fib_last_digits(60)[fibonacci_last(n%60) - 1]
end


p fast_fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fast_fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fast_fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fast_fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fast_fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fast_fibonacci_last(123456789) # -> 4
p fast_fibonacci_last(123456789987745) # -> 5

