# Create a hash that expresses the frequency with which each letter occurs in 
# this string:

statement = "The Flintstones Rock"

# We can start by creating an array of characters using the String#chars method.
# Then, we can iterate through the array with Array#each_with_object and an 
# empty hash. On each iteration, we will check if a key exists; if it exists, we
# will increment the value by 1, otherwise we will initialize a new k-v pair
# with a value of 1.

frequencies = statement.chars.each_with_object({}) do |letter, hash|
  if hash.key?(letter)
    hash[letter] += 1
 else
    hash[letter] = 1
  end
end

p frequencies