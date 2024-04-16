# Unlucky Days

# Write a method that returns the number of Friday the 13ths in the year given 
# by an argument. You may assume that the year is greater than 1752 (when the 
# United Kingdom adopted the modern Gregorian Calendar) and that it will remain 
# in use for the foreseeable future.

require 'date'

def friday_13th(year)
  counter = 0
  (1..12).each do |month|
    counter += 1 if Date.new(year, month, 13).friday?
  end
  counter
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2