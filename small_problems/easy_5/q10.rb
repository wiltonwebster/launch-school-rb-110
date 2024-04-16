# Spin Me Around In Circles

# You are given a method named spin_me that takes a string as an argument and 
# returns a string that contains the same words, but with each word's characters
# reversed. Given the method's implementation, will the returned string be the 
# same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# This method will return a new string. The original string object is passed to
# the parameter variable str, but is then used to create an array with the 
# #split method. The array is generated with substrings of str, but each
# substring is a new string object. Those objects are then mutated by the 
# #reverse! method call, and a new string object is created and returned at the
# end by the #join method.