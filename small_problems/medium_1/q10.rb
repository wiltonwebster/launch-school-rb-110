# Fibonacci Numbers (Last Digit)

# In the previous exercise, we developed a procedural method for computing the 
# value of the nth Fibonacci numbers. This method was really fast, computing the 
# 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last 
# digit of the nth Fibonacci number.

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

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4