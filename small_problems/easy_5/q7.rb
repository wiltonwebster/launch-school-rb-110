# Letter Counter (Part 2)

# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.

def word_sizes(string)
  words = string.split
  words.each_with_object({}) do |word, frequencies|
    size = word_length(word)
    if frequencies.key?(size)
      frequencies[size] += 1
    else
      frequencies[size] = 1
    end
  end
end

def word_length(word)
  letter_count = 0
  word.each_char { |char| letter_count += 1 if char.match(/[A-Za-z]/) }
  letter_count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}