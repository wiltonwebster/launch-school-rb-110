# Card Deck

# We started working on a card game but got stuck. Check out why the code below 
# raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the 
# sum is off: It's lower than it should be. Why is that?

require 'pry'

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  map = remaining_cards.map do |card|
    score(card)
  end
  binding.pry
  sum += map.sum
end

puts sum

# Our sum is incorrect because we have assigned the cards array as the value for
# all four k-v pairs in our deck hash. When we mutate the cards array while 
# dealing ourself a card from each suit, we are removing all 4 of that card from
# the deck, rather than only from that suit. We can fix this by changing cards
# to cards.clone in each k-v pair, thus giving us 4 new copies of the cards 
# array which can be safely mutated. 