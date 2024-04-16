# Group Anagrams

# Given the array:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. Anagrams 
# are words that have the same exact letters in them but in a different order. 
# Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

def anagrams(list_of_words)
  anagram_list = []
  char_sets = list_of_words.map(&:chars)
  char_sets.each do |current_chars|
    curr_anagrams = char_sets.select do |char_set| 
      char_set.sort == current_chars.sort
    end
    anagram_list << curr_anagrams.map { |list| list.join }
  end
  anagram_list.each(&:sort).uniq.each { |anagram_list| p anagram_list }
end

# anagrams(words)

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end