# main.rb
#   Description: Play a game of mastermind with computer generated code.
#   paramters:
#   return value:

require 'colorize'
require_relative 'lib/player'
require_relative 'lib/board'

# Create Player and Game objects
new_game = Board.new
player_1 = Player.new

# Display Initial Game State
print new_game.board_state; print "\n"

# Loop through game rounds
new_game.number_turns.times { |index|
  puts "Welcome to Round #{index+1}!"
  
  # Ask user for guess
  player_1.request_guess
  
  # Compare guess to solution and report diff
  new_game.check_guess(player_1.current_guess)

  # Break loop if game won
  break if new_game.report_diff == true
}

if new_game.has_won != false
  puts 'Game Over! Better luck next time!'
else
  puts 'Thanks for playing!'
end
