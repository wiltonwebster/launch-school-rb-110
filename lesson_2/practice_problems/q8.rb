# Using the each method, write some code to output all of the vowels from the 
# strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], 
fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |word|
    puts word.chars.select { |char| char =~ /[aeiou]/i }
  end
end

