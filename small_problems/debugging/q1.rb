# Countdown

# Our countdown to launch isn't behaving as expected. Why? Change the code so
# that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

# The decrease method is being passed an immutable object. It returns the 
# correct number for counter, but the object referenced by counter is not 
# actually updated. This could be resolved by changing line 14 to:

counter = decrease(counter)