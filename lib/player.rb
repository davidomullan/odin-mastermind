## player
# This class represents a player for the mastermind game
class Player
  attr_accessor :current_guess, :possible_code
  
  def initialize()
    @current_guess = Array.new(4, 0)
    @possible_code = possible_permutations
  end
  
  def possible_permutations
    a = [1, 2, 3, 4, 5, 6]
    b = a.repeated_permutation(4).to_a
    return b
  end
  
  def request_guess
    self.current_guess.each_with_index { |elem, i|
      print "Enter value #{i+1}: "
      self.current_guess[i] = gets.chomp
      abort('Thanks for playing! Hope you come back soon!') if self.current_guess[i] == 'q' || self.current_guess[i] == 'quit'
    }
  end
  
  def generate_guess
    self.current_guess = self.possible_code.sample
  end

  def update_possible_code(diff_state)
    self.possible_code.delete_if { |x|
      diff_state and check_guess(self.current_guess, x) != diff_state
    }
  end

  def check_guess(guess, code)
    diff_state = Array.new(4, 0)
    board_state = Array.new(4, 0)
    
    guess.each_with_index { |elem, i|
      if elem.to_i  == code[i]
        diff_state[i] = 1
        board_state[i] = elem.to_i
      end
    }
    
    guess.each_with_index { |elem, i|
      if code.include?(elem.to_i) and not board_state.include?(elem.to_i)
        diff_state[i] = 2
      end
      board_state[i] = elem.to_i
    }
    
    return diff_state
  end

  
end
