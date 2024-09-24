## player
# This class represents a player for the mastermind game
class Player
  attr_reader :current_guess
  
  def initialize()
    @current_guess = Array.new(4, 0)
  end
  
  def request_guess
    current_guess.each_with_index { |elem, i|
      print "Slot #{i+1}: "
      current_guess[i] = gets
      abort('Thanks for playing! Hope you come back soon!') if current_guess[i] == "q\n" || current_guess[i] == "quit\n"
    } 
  end
end
