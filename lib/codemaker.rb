## Codemaker
# This class represents the codemaker for the mastermind game
class Codemaker
  attr_accessor :code

  def initialize
    @code = random_code
    puts "Random code: #{self.code}"
  end

  def random_code
    self.code = Array.new(4) { rand(1..6) }
  end

  def gets_code
    self.code.each_with_index { |elem, i|
      self.code[i] = gets
    }
  end
end
