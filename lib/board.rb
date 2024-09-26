## Board
# This class represents a game board for mastermind

class Board
  attr_accessor :board_state, :diff_state, :has_won
  @@number_turns = 12

  # Return value of class variable number_turns
  def number_turns
    @@number_turns
  end
  
  def initialize()
    @has_won = false
    @board_state = Array.new(4, 0)
    @diff_state = Array.new(4, 0)
  end

  def check_guess(player_guess, game_solution)
    self.board_state = Array.new(4, 0)
    self.diff_state = Array.new(4, 0)

    puts "player_guess: #{player_guess}"
    puts "game_solution: #{game_solution}"
    player_guess.each_with_index { |elem, i|
      if elem.to_i  == game_solution[i]
        self.diff_state[i] = 1
        self.board_state[i] = elem.to_i
      end
    }

    puts "diff_state: #{self.diff_state}"
    
    player_guess.each_with_index { |elem, i|
      if game_solution.include?(elem.to_i) and not self.board_state.include?(elem.to_i)
        self.diff_state[i] = 2
      end

      self.board_state[i] = elem.to_i
    }
    
    print_board
  end

  def report_diff(game_mode)
    if self.diff_state == Array.new(4, 1) then
      if game_mode == 'g'
        puts "Congratulations, you win!"
        self.has_won = true
      else # game_mode == 'c'
        puts 'The computer guessed your code!'
        self.has_won = true
      end
    else
      print_diff
    end
    return self.has_won
  end

  def print_board
    print '('
    self.board_state.each { |elem|
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

  def print_code(code)
    print '('
    code.each { |elem|
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
    shuffled_diff = self.diff_state.shuffle
    print '('
    shuffled_diff.each { |elem|
      case elem
      when 0
        print ' '
      when 1
        print 'O'.colorize(:white)
      when 2
        print 'O'.colorize(:black)
      end
    }
    print ")\n"
  end
end
