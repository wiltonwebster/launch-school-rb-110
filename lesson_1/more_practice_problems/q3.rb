# In the ages hash, remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# We can use Hash#reject in order to remove undesired k-v pairs.

new_ages = ages.reject { |name, age| age >= 100 }

p new_ages

# The solution points out we can also use Hash#keep_if, which acts like select!
# except it does not return nil when no changes are made (note: keep_if is
# destructive, like select!).