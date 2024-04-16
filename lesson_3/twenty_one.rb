STANDARD_DECK = [
  { type: 'Two', suit: 'Hearts', value: 2 },
  { type: 'Two', suit: 'Spades', value: 2 },
  { type: 'Two', suit: 'Diamonds', value: 2 },
  { type: 'Two', suit: 'Clubs', value: 2 },
  { type: 'Three', suit: 'Hearts', value: 3 },
  { type: 'Three', suit: 'Spades', value: 3 },
  { type: 'Three', suit: 'Diamonds', value: 3 },
  { type: 'Three', suit: 'Clubs', value: 3 },
  { type: 'Four', suit: 'Hearts', value: 4 },
  { type: 'Four', suit: 'Spades', value: 4 },
  { type: 'Four', suit: 'Diamonds', value: 4 },
  { type: 'Four', suit: 'Clubs', value: 4 },
  { type: 'Five', suit: 'Hearts', value: 5 },
  { type: 'Five', suit: 'Spades', value: 5 },
  { type: 'Five', suit: 'Diamonds', value: 5 },
  { type: 'Five', suit: 'Clubs', value: 5 },
  { type: 'Six', suit: 'Hearts', value: 6 },
  { type: 'Six', suit: 'Spades', value: 6 },
  { type: 'Six', suit: 'Diamonds', value: 6 },
  { type: 'Six', suit: 'Clubs', value: 6 },
  { type: 'Seven', suit: 'Hearts', value: 7 },
  { type: 'Seven', suit: 'Spades', value: 7 },
  { type: 'Seven', suit: 'Diamonds', value: 7 },
  { type: 'Seven', suit: 'Clubs', value: 7 },
  { type: 'Eight', suit: 'Hearts', value: 8 },
  { type: 'Eight', suit: 'Spades', value: 8 },
  { type: 'Eight', suit: 'Diamonds', value: 8 },
  { type: 'Eight', suit: 'Clubs', value: 8 },
  { type: 'Nine', suit: 'Hearts', value: 9 },
  { type: 'Nine', suit: 'Spades', value: 9 },
  { type: 'Nine', suit: 'Diamonds', value: 9 },
  { type: 'Nine', suit: 'Clubs', value: 9 },
  { type: 'Ten', suit: 'Hearts', value: 10 },
  { type: 'Ten', suit: 'Spades', value: 10 },
  { type: 'Ten', suit: 'Diamonds', value: 10 },
  { type: 'Ten', suit: 'Clubs', value: 10 },
  { type: 'Jack', suit: 'Hearts', value: 10 },
  { type: 'Jack', suit: 'Spades', value: 10 },
  { type: 'Jack', suit: 'Diamonds', value: 10 },
  { type: 'Jack', suit: 'Clubs', value: 10 },
  { type: 'Queen', suit: 'Hearts', value: 10 },
  { type: 'Queen', suit: 'Spades', value: 10 },
  { type: 'Queen', suit: 'Diamonds', value: 10 },
  { type: 'Queen', suit: 'Clubs', value: 10 },
  { type: 'King', suit: 'Hearts', value: 10 },
  { type: 'King', suit: 'Spades', value: 10 },
  { type: 'King', suit: 'Diamonds', value: 10 },
  { type: 'King', suit: 'Clubs', value: 10 },
  { type: 'Ace', suit: 'Hearts', value: 11 },
  { type: 'Ace', suit: 'Spades', value: 11 },
  { type: 'Ace', suit: 'Diamonds', value: 11 },
  { type: 'Ace', suit: 'Clubs', value: 11 }
]
DEALER_CUTOFF = 17
LIMIT = 21


def prompt(message)
  puts "=> #{message}"
end

def line_break
  puts ''
end

def initialize_players
  player = { name: 'Player', hand: [], score: 0 }
  dealer = { name: 'Dealer', hand: [], score: 0 }
  [player, dealer]
end

def get_player_name(person)
  prompt 'Please enter your name:'
  person[:name] = gets.chomp
  prompt "Hello #{person[:name]}!"
end

def shuffle_deck
  prompt "Shuffling deck..."
  sleep(2)
  STANDARD_DECK.shuffle
end

def deal_hands(deck)
  prompt "Dealing cards..."
  sleep(2)
  line_break
  player_hand = deck.shift(2)
  dealer_hand = deck.shift(2)
  [player_hand, dealer_hand]
end

def description(card)
  "#{card[:type]} of #{card[:suit]}"
end

def display_hand(person)
  cards = person[:hand].map { |card| description(card) }
  prompt "#{person[:name]}'s hand: #{cards.join(', ')}."
  prompt "Current hand total: #{hand_total(person[:hand])}"
  line_break
end

def display_dealer_card(person)
  card = person[:hand][0]
  prompt "Dealer's face-up card: #{description(card)}."
  prompt "Dealer is showing #{card[:value]}."
  line_break
end

def hand_total(hand)
  total = hand.map { |card| card[:value] }.reduce(:+)

  hand.select { |card| card[:type] == 'Ace' }.count.times do
    total -= 10 if total > LIMIT
  end

  total
end

def player_turn(player, deck)
  loop do
    prompt 'Would you like to hit or stay?'
    player_action = validate_action(gets.chomp.downcase)
    break if player_action == 'stay'

    hit(player, deck)
    display_hand(player)
    break if busted?(player)
  end
end

def validate_action(action)
  until action == 'hit' || action == 'stay'
    prompt 'Invalid entry. Please select hit or stay.'
    action = gets.chomp.downcase
  end
  action
end

def hit(person, deck)
  new_card = deck.pop
  prompt "Card drawn: #{description(new_card)}."
  person[:hand] << new_card
end

def busted?(person)
  hand_total(person[:hand]) > LIMIT
end

def display_turn_result(person)
  if busted?(person)
    prompt "#{person[:name]} busted!"
  else
    prompt "#{person[:name]} chose to stay at #{hand_total(person[:hand])}."
  end
  line_break
end

def dealer_turn(dealer, deck)
  prompt "Now it's the dealer's turn."
  sleep(2)
  display_hand(dealer)
  until hand_total(dealer[:hand]) >= DEALER_CUTOFF
    prompt 'Dealer chooses to hit...'
    sleep(2)
    hit(dealer, deck)
    display_hand(dealer)
    sleep(5)
  end
end

def detect_hand_winner(player, dealer)
  return dealer if busted?(player)
  return player if busted?(dealer)

  case hand_total(player[:hand]) <=> hand_total(dealer[:hand])
  when 1 then player
  when -1 then dealer
  end
end

def display_hand_result(winner)
  if winner
    prompt "#{winner[:name]} wins this round!"
  else
    prompt "It's a tie!"
  end
end

def update_scores!(winner)
  winner[:score] += 1 if winner
end

def display_scores(people)
  people.each { |person| prompt "#{person[:name]}: #{person[:score]}" }
  line_break
end

def someone_won_match?(player, dealer)
  !!detect_match_winner(player, dealer)
end

def detect_match_winner(player, dealer)
  if player[:score] >= 5
    player
  elsif dealer[:score] >= 5
    dealer
  end
end

def display_match_result(player, dealer)
  winner = detect_match_winner(player, dealer)
  prompt "#{winner[:name]} wins the match!"
  prompt 'Final score:'
  display_scores([player, dealer])
end

# Start of game

prompt "Welcome to Twenty-One!"
player, dealer = initialize_players
get_player_name(player)
prompt "First to 5 points wins. Shuffle up and deal!"

loop do
  deck = shuffle_deck
  player[:hand], dealer[:hand] = deal_hands(deck)

  display_hand(player)
  display_dealer_card(dealer)

  player_turn(player, deck)
  display_turn_result(player, dealer)

  if !busted?(player)
    dealer_turn(dealer, deck)
    display_turn_result(dealer, player)
  end

  winner = detect_hand_winner(player, dealer) # returns nil if tie
  display_hand_result(winner)
  update_scores!(winner)
  break if someone_won_match?(player, dealer)
  prompt 'Current Score:'
  display_scores([player, dealer])

  prompt 'Hit Enter to begin the next hand.'
  gets.chomp
end

display_match_result(player, dealer)
prompt 'Thanks for playing Twenty-One. Goodbye!'
