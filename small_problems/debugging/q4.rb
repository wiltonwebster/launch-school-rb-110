# Reverse Sentence

# The reverse_sentence method should return a new string with the words of its 
# argument in reverse order, without using any of Ruby's built-in reverse 
# methods. However, the code below raises an error. Change it so that it behaves
# as expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# The error is on line 14, attempting to combine words[i], a string, with 
# reversed_words, an array. In order to combine these into one array, as desired
# we should rewrite the first input as an array:

[words[i]]