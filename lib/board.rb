## Board
# This class represents a game board for mastermind

class Board
  attr_reader :board_state, :number_turns, :game_solution, :diff_state, :has_won
  @@number_turns = 12

  # Return value of class variable number_turns
  def number_turns
    @@number_turns
  end
  
  def initialize()
    @has_won = false
    @board_state = Array.new(4, 0)
    @diff_state = Array.new(4, 0)
    @game_solution = generate_code
  end

  def generate_code
    return Array.new(4) { rand(1..6) }
  end

  def check_guess(player_guess)
    player_guess.each_with_index { |elem, i|
      if elem.to_i  == game_solution[i]
        diff_state[i] = 1
      else
        diff_state[i] = 0
      end
    }
  end

  def report_diff
    if diff_state == Array.new(4, 1)
      puts "Congratulations, you win!"
      has_won = true
    else
      print "Difference from Solution: #{diff_state}\n"
    end
    return has_won
  end
end
