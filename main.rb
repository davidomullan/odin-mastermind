# main.rb
#   Description: Play a game of mastermind with computer generated code.
#   paramters:
#   return value:

require 'colorize'
require_relative 'lib/player'
require_relative 'lib/codemaker'
require_relative 'lib/board'

# Create Player and Game objects
new_game = Board.new
player = Player.new
codemaker = Codemaker.new

# Display Initial Game State
print player.current_guess; print "\n"

# Loop through game rounds
new_game.number_turns.times { |index|
  puts "Welcome to Round #{index+1}!"
  
  # Ask user for guess
  player.request_guess
  
  # Compare guess to solution and report diff
  new_game.check_guess(player.current_guess, codemaker.code)

  # Break loop if game won
  break if new_game.report_diff == true
}

if new_game.has_won != false
  puts 'Game Over! Better luck next time!'
else
  puts 'Thanks for playing!'
end
