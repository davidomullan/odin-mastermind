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
game_mode = ''

# Choose Game Mode
print 'Welcome to the game of Mastermind! Would you like to be the guesser or codemaker? (Enter: g or c): '
while true do
  game_mode = gets.chomp
  if game_mode == 'g' or game_mode == 'c'
    break
  elsif game_mode == 'q' or game_mode == 'quit'
    abort('Hope you come back soon!')
  else
    puts 'Please enter a valid key: g (guesser) or c (codemaker)'
  end
end

if game_mode == 'g' then
  # Loop through game rounds
  new_game.number_turns.times { |index|
    puts "Welcome to Round #{index+1}!"
    
    # Ask user for guess
    player.request_guess
    
    # Compare guess to solution and report diff
    new_game.check_guess(player.current_guess, codemaker.code)
    
    # Break loop if game won
    break if new_game.report_diff(game_mode) == true
  }
  
  if new_game.has_won == false
    print 'The code was: '
    new_game.print_code(codemaker.code)
    puts 'Game Over! Better luck next time!'
  else
    puts 'Thanks for playing!'
  end

# User is codemaker
else
  # Ask user for code
  codemaker.code.each_with_index { |elem, i|
    print "Enter value #{i+1}: "
    while true do
      codemaker.code[i] = gets.chomp.to_i
      if (1..6).include?(codemaker.code[i]) then
        break
      else
        print 'Please try again (1-6): '
      end
    end
  }

  # Display Code
  new_game.print_code(codemaker.code)
  
  # Loop through game rounds
  new_game.number_turns.times { |index|
    puts "Welcome to Round #{index+1}!"
    
    # Ask computer for guess
    player.generate_guess
    
    # Compare guess to solution and report diff
    new_game.check_guess(player.current_guess, codemaker.code)
    
    # Break loop if game won
    break if new_game.report_diff(game_mode) == true

    # Update possible_code array
    player.update_possible_code(new_game.diff_state)
  }
  
  if new_game.has_won == false
    puts 'Congratulations! The computer failed to guess your code!'
  end
  puts 'Thanks for playing!'
end
