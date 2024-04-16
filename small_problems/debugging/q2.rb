# HEY YOU!

# String#upcase! is a destructive method, so why does this code print HEY you
# instead of HEY YOU? Modify the code so that it produces the expected output.

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# Strings are not treated as collections of characters in the same way as other
# Ruby collections. Calling upcase! on one character of a string mutates the
# individual one-character string object, but it does not mutate the original
# string object from which the character was pulled. To fix this code, we should
# call upcase directly on name:

puts 'Hey ' + name.upcase