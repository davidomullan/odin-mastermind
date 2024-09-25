## player
# This class represents a player for the mastermind game
class Player
  attr_accessor :current_guess
  
  def initialize()
    @current_guess = Array.new(4, 0)
  end
  
  def request_guess
    self.current_guess.each_with_index { |elem, i|
      print "Slot #{i+1}: "
      self.current_guess[i] = gets
      abort('Thanks for playing! Hope you come back soon!') if self.current_guess[i] == "q\n" || self.current_guess[i] == "quit\n"
    } 
  end
end
