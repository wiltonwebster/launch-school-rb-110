# Cute angles

# Write a method that takes a floating point number that represents an angle 
# between 0 and 360 degrees and returns a String that represents that angle in 
# degrees, minutes and seconds. You should use a degree symbol (°) to represent 
# degrees, a single quote (') to represent minutes, and a double quote (") to 
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"

def dms(input)
  input %= 360
  degrees = input.to_i
  remainder = (input - degrees) * 60
  minutes = remainder.to_i
  seconds = ((remainder - minutes) * 60).round
  
  # correction for rounding error:
  if seconds >= 60
    seconds -= 60
    minutes += 1
  end
  if minutes >= 60
    minutes -= 60
    degrees += 1
  end
  if degrees >= 360
    degrees -= 360
  end
  
  
  format('%d%s%02d\'%02.0f"', degrees, DEGREE, minutes, seconds)
end

# All test cases should return true
puts dms(30) # == %(30°00'00")
puts dms(76.73) # == %(76°43'48")
puts dms(254.6) # == %(254°36'00")
puts dms(93.034773) # == %(93°02'05")
puts dms(0) # == %(0°00'00")
puts dms(360) # == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) # == %(40°00'00")
puts dms(-40) # == %(320°00'00")
puts dms(-420) # == %(300°00'00")