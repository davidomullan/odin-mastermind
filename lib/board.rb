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
      board_state[i] = elem.to_i
      if elem.to_i  == game_solution[i]
        diff_state[i] = 1
      else
        diff_state[i] = 0
      end
    }
  end

  def report_diff
    print_board
    if diff_state == Array.new(4, 1)
      puts "Congratulations, you win!"
      has_won = true
    else
      print_diff
    end
    return has_won
  end

  def print_board
    print '('
    board_state.each_with_index { |elem, index|
      case elem
      when 1
        print '1'.colorize(:red)
      when 2
        print '2'.colorize(:blue)
      when 3
        print '3'.colorize(:yellow)
      when 4
        print '4'.colorize(:green)
      when 5
        print '5'.colorize(:magenta)
      when 6
        print '6'.colorize(:cyan)
      end
    }
    print ")\n"
  end

  def print_diff
    print '('
    diff_state.each { |elem|
      case elem
      when 0
        print '0'.colorize(:black)
      when 1
        print '1'.colorize(:white)
      end
    }
    print ")\n"
  end
end
