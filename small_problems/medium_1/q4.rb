# 1000 Lights

# You have a bank of switches before you, numbered from 1 to n. Each switch is 
# connected to exactly one light that is initially off. You walk down the row of 
# switches and toggle every one of them. You go back to the beginning, and on 
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, 
# you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
# repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and 
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4. 
# The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. 
# The return value is [1, 4, 9].

def lights_by_squares(n)
  counter = 1
  result = []
  until counter ** 2 > n
    result << counter ** 2
    counter += 1
  end
  result
end

# p lights_by_squares(10)

def lights_by_brute_force(n)
  lights = [0] * n
  (1..n).each do |flip|
    lights.each_index do |idx|
      lights[idx] += 1 if (idx + 1) % flip == 0
    end
  end
  flipped = []
  lights.each_with_index do |light, idx|
    flipped << (idx + 1) if light.odd?
  end
  flipped
end

p lights_by_brute_force(1000)