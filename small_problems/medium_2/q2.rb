# Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that 
# do not use both letters from any given block. Each letter in each block can 
# only be used once.

# Write a method that returns true if the word passed in as an argument can be 
# spelled from this set of blocks, false otherwise.

def block_word?(word)
  ascii_values = word.downcase.chars.map { |char| char.ord }
  block_values = ascii_values.map { |value| value % 13 }
  block_values == block_values.uniq # returns false if any block is reused
end

p block_word?('hello') # == false
p block_word?('BATCH') # == true
p block_word?('BUTCH') # == false
p block_word?('jest') # == true