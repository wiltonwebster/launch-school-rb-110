# fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers from the starting 
# number to the ending number, except if a number is divisible by 3, print 
# "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number 
# is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(start_num, end_num)
  result = []
  (start_num..end_num).each do |number|
    result << fizzbuzz?(number)
  end
  puts result.join(', ')
end

def fizzbuzz?(number)
  if multiple_of_5?(number) && multiple_of_3?(number)
    "FizzBuzz"
  elsif multiple_of_5?(number)
    "Buzz"
  elsif multiple_of_3?(number)
    "Fizz"
  else
    number
  end
end

def multiple_of_5?(num)
  num % 5 == 0
end

def multiple_of_3?(num)
  num % 3 == 0
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz