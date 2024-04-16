# Given the munsters hash below:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional 
# "age_group" key that has one of three values describing the age group the 
# family member is in (kid, adult, or senior). 

# Your solution should produce the hash below:

solution = {
  "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
}

  
age_classifications = { (0..17) => 'kid', (18..64) => 'adult', (65..) => 'senior' }

munsters.each do |_,info|
  age_classifications.each do |age_range, age_class|
    info['age_group'] = age_class if age_range.include?(info['age'])
  end
end

p munsters == solution

# Solution points out that we can use a case statement for the age ranges, 
# rather than implementing a new hash for the age classifications. 
# Provided solution:

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end