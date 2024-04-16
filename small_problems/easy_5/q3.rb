# As seen in the previous exercise, the time of day can be represented as the 
# number of minutes before or after midnight. If the number of minutes is 
# positive, the time is after midnight. If the number of minutes is negative, 
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return 
# the number of minutes before and after midnight, respectively. Both methods 
# should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

def after_midnight(time_str)
  clock_reading_to_minutes(time_str) % 1440
end

def before_midnight(time_str)
  (1440 - clock_reading_to_minutes(time_str)) % 1440
end

def clock_reading_to_minutes(time_str)
  hours, minutes = time_str.split(':').map { |str| str.to_i }
  hours * 60 + minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0