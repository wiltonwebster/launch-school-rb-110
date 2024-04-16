INITIAL_MARKER = ' '
PLAYER_MARKERS = ['X', 'O'] # Player moving first always uses first marker.
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(message)
  puts "=> #{message}"
end

def line_break
  puts ""
end

def joinor(list, delimiter = ', ', conjunction = 'or')
  case list.size
  when (0..1) then list.join
  when 2 then list.join(" #{conjunction} ")
  else list[0..-2].join(delimiter) + "#{delimiter}#{conjunction} #{list[-1]}"
  end
end

def initialize_players
  {
    player1: { name: '', goes_first: false, marker: '', score: 0 },
    player2: { name: '', goes_first: false, marker: '', score: 0 }
  }
end

def select_number_of_players
  prompt 'Please enter the number of players (1 or 2):'
  num_players = gets.chomp.to_i
  until num_players == 1 || num_players == 2
    prompt 'Invalid entry. Please enter 1 or 2:'
    num_players = gets.chomp.to_i
  end
  num_players
end

def get_player_names!(players, num_players)
  prompt 'Enter a name for Player 1:'
  players[:player1][:name] = gets.chomp
  if num_players == 2
    prompt 'Enter a name for Player 2:'
    players[:player2][:name] = gets.chomp
  else
    players[:player2][:name] = 'Computer'
  end
  prompt "#{players[:player1][:name]} vs. #{players[:player2][:name]}"
end

def decide_who_goes_first!(players)
  first_move = [:player1, :player2].sample
  players[first_move][:goes_first] = true
  assign_markers(players)
  prompt 'First to 5 points wins! Selecting who goes first...'
  sleep(4)
  prompt "#{players[first_move][:name]} goes first!"
end

def assign_markers(players)
  players.values.each do |player|
    if player[:goes_first]
      player[:marker] = PLAYER_MARKERS[0]
    else
      player[:marker] = PLAYER_MARKERS[1]
    end
  end
end

def initialize_board
  (1..9).each_with_object({}) { |key, hash| hash[key] = INITIAL_MARKER }
end

def display_board(brd)
  puts ''
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]}"
  puts '---+---+---'
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]}"
  puts '---+---+---'
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]}"
  puts ''
end

def take_turn!(players, curr_player, num_players, board)
  if curr_player == :player2 && num_players == 1
    computer_takes_turn!(board, players, curr_player)
  else
    player_takes_turn!(board, players, curr_player)
  end
end

def player_takes_turn!(brd, players, curr_player)
  prompt "It is #{players[curr_player][:name]}'s turn \
  (#{players[curr_player][:marker]})."
  prompt "Choose an available square: #{joinor(available_squares(brd))}"
  square = player_square_selection(brd)
  brd[square] = players[curr_player][:marker]
end

def player_square_selection(brd)
  square = gets.chomp.to_i
  until validate_number(square) && validate_availability(square, brd)
    if !validate_number(square)
      prompt 'Invaild entry.'
      prompt "Please choose an available square: \
      #{joinor(available_squares(brd))}"
    elsif !validate_availability(square, brd)
      prompt 'That square is already filled.'
      prompt "Please choose an available square: \
      #{joinor(available_squares(brd))}"
    end
    square = gets.chomp.to_i
  end
  square
end

def validate_number(num)
  (1..9).include?(num)
end

def validate_availability(square, brd)
  available_squares(brd).include?(square)
end

def available_squares(brd)
  brd.keys.select { |square| brd[square] == INITIAL_MARKER }
end

def computer_takes_turn!(brd, players, curr_player)
  prompt "It is the Computer's turn (#{players[curr_player][:marker]})."
  prompt 'The Computer is thinking...'
  sleep(rand(2..4))
  square = computer_square_selection(brd, players, curr_player)
  brd[square] = players[curr_player][:marker]
end

def computer_square_selection(brd, players, curr_player)
  computer_marker = players[curr_player][:marker]
  player_marker = players[:player1][:marker]
  square = nil
  # Attempt to win
  WINNING_LINES.each do |line|
    square = detect_vulnerable_square(brd, line, computer_marker)
    break if square
  end
  # Attempt to defend
  if !square
    WINNING_LINES.each do |line|
      square = detect_vulnerable_square(brd, line, player_marker)
      break if square
    end
  end
  # Attempt to occupy central square
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end
  # Make a random move
  if !square
    square = available_squares(brd).sample
  end
  square
end

def detect_vulnerable_square(brd, line, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def someone_won_game?(players, brd)
  !!detect_game_winner(players, brd)
end

def detect_game_winner(players, brd)
  WINNING_LINES.each do |line|
    line_markers = brd.values_at(*line)
    if line_markers.count(players[:player1][:marker]) == 3
      return :player1
    elsif line_markers.count(players[:player2][:marker]) == 3
      return :player2
    end
  end
  nil
end

def board_full?(brd)
  available_squares(brd).empty?
end

def display_result(players, winner)
  if winner
    prompt "#{players[winner][:name]} won that round."
  else
    prompt "It's a tie!"
  end
  line_break
end

def update_scores!(players, winner)
  if winner
    players[winner][:score] += 1
  else
    players.values.each { |player| player[:score] += 0.5 }
  end
end

def display_current_scores(players)
  prompt 'Current Score:'
  display_scoreboard(players)
end

def display_scoreboard(players)
  players.values.each { |player| prompt "#{player[:name]}: #{player[:score]}" }
  line_break
end

def switch_who_goes_first!(players)
  players.values.each do |player|
    player[:goes_first] = !player[:goes_first]
    if player[:goes_first]
      prompt "#{player[:name]} goes first!"
      line_break
    end
  end
  assign_markers(players)
end

def winning_score_reached?(players)
  players[:player1][:score] >= 5 || players[:player2][:score] >= 5
end

def detect_match_winner(players)
  case players[:player1][:name] <=> players[:player2][:name]
  when -1 then :player2
  when 1 then :player1
  end
end

def display_match_result(players, winner)
  if winner
    prompt "#{players[winner][:name]} has won the match!"
  else
    prompt 'The match is a draw!'
  end
  prompt 'Final Score:'
  display_scoreboard(players)
end

# Start of game

prompt 'Welcome to Tic Tac Toe!'

loop do
  players = initialize_players
  num_players = select_number_of_players
  get_player_names!(players, num_players)
  decide_who_goes_first!(players)

  loop do
    whose_turn = players[:player1][:goes_first] ? :player1 : :player2
    board = initialize_board
    display_board(board)

    loop do
      take_turn!(players, whose_turn, num_players, board)
      display_board(board)
      break if someone_won_game?(players, board) || board_full?(board)
      whose_turn = whose_turn == :player1 ? :player2 : :player1 # Switch turns
    end

    winner = detect_game_winner(players, board)
    # detect_game_winner returns nil if game is a draw
    display_result(players, winner)
    update_scores!(players, winner)
    break if winning_score_reached?(players)
    display_current_scores(players)
    sleep(3)
    switch_who_goes_first!(players)
  end

  match_winner = detect_match_winner(players)
  display_match_result(players, match_winner)

  prompt 'Would you like to start a new match? (y/n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe. Goodbye!'
