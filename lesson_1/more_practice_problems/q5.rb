# In the array, find the index of the first name that starts with "Be".

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# We can use the Array#index method with a block to find the index of the first
# element that returns a truthy value when passed to the block. We can use the
# String#start_with? method to return true when one of the strings starts with
# 'Be'.

idx = flintstones.index { |name| name.start_with?('Be') }

puts idx