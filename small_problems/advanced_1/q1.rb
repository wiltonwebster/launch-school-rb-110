# Madlibs Revisited

# Let's build another program using madlibs. We made a program like this in the 
# easy exercises. This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have 
# created, and then plugs in a selection of randomized nouns, verbs, adjectives, 
# and adverbs into that text and prints it. You can build your lists of nouns, 
# verbs, adjectives, and adverbs directly into your program, but the text data 
# should come from a file or other external source. Your program should read 
# this text, and for each line, it should place random words of the appropriate 
# types into the text, and print the result.

input_text = File.read('sample.txt')

adj, noun, verb, adv = input_text.split("\n").map(&:split)

story = 
  "The #{adj.sample} brown #{noun.sample} #{adv.sample} #{verb.sample} \
the #{adj.sample} yellow #{noun.sample}, who #{adv.sample} #{verb.sample} \
his #{noun.sample} and looks around."
  
p story