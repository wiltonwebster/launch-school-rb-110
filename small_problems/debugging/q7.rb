# Neutralizer

# We wrote a neutralize method that removes negative words from sentences.
# However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# The array of words is being mutated while the iteration is ongoing. The word
# boring is not deleted because when the each method attempts to find the 
# element at index 2, it finds 'cards' instead of 'boring'. Effectively, the 
# mutation causes 'boring' to be skipped. We can fix this by using a non-
# mutating method instead. Alternatively, we can use a mutating method that 
# doesn't mutate during iteration (such as reject!).