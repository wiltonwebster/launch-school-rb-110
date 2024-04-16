# The time of day can be represented as the number of minutes before or after 
# midnight. If the number of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns 
# the time of day in 24 hour format (hh:mm). Your method should work with any 
# integer input.

# You may not use ruby's Date and Time classes.

def time_of_day(integer)
  improper_minutes = integer % 1440
  hours_minutes = improper_minutes.divmod(60)
  strings = (
    hours_minutes.map do |num|
    if num < 10
      num.to_s.prepend('0')
    else
      num.to_s
    end
  end
  )
  strings.join(':')
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Note: we can use the format method with %02d in order to format the hour and
# minute integers to strings. The 0 flag denotes leading zero and the 2 flag
# denotes a minimum width of 2. Together, these flags cause single digit outputs
# to be reformatted with a single leading zero.