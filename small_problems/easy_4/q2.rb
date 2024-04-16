# Write a method that takes a year as input and returns the century. The return 
# value should be a string that begins with the century number, and ends with 
# st, nd, rd, or th as appropriate for that number.

def century(year)
  century = (year - 1) / 100 + 1
  suffix = ordinal(century)
  century.to_s + suffix
end

def ordinal(integer)
  tens_place = (integer % 100) / 10
  ones_place = integer % 10
  if tens_place != 1
    case ones_place
      when 1 
        suffix = "st"
      when 2 
        suffix = "nd"
      when 3
        suffix = "rd"
      else 
        suffix = "th"
    end
  else 
    suffix = "th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'