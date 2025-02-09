# Number Guessing Game

# A friend of yours wrote a number guessing game. The first version he shows you
# picks a random number between 1 and a provided maximum number and offers you a 
# given number of attempts to guess it.

# However, when you try it, you notice that it's not working as expected. Run 
# the code and observe its behavior. Can you figure out what is wrong?

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)

# The Try again recursive method call on line 37 is unnecessary and completely
# breaks the program. Every time we don't guess the number, we initiate a new 
# game within the current game with a new winning number and 3 guesses. The loop
# is already handling this behavior; we can delete that line and the code should
# run as intended.

# Addendum: We also need to add a break after line 31 so that we exit the loop
# if we guess correctly.