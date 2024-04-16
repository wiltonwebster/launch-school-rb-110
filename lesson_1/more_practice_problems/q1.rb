# Turn this array into a hash where the names are the keys and the values are 
# the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# each_with_object and each_with_index both seem to work here, with small 
# trade-offs in terms of ability to pass in the index vs. ability to pass in 
# the new hash object. I have selected each_with_index in this instance:

flintstones_hash = {}

flintstones.each_with_index { |name, idx| flintstones_hash[name] = idx }

p flintstones_hash