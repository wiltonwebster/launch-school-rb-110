# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Again, we can use the Hash#values method to return an array of values, which we
# can then call Array#min on.

min_age = ages.values.min

p min_age