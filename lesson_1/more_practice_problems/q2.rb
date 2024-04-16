# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# We can turn the set of hash values into an array using the Hash#values method
# and add them up using the Array#sum method.

ages_total = ages.values.sum

p ages_total