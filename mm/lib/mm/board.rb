class Board
  
  CHOICES = "RGYBMC"
  
  def initialize
    @secret = random_code
    @moves = []
  end 
  
  private
  def print_row(move, assessment)
    symbols = move.symbols
    symbols.each do |s| 
      choice = s.to_s
      index = CHOICES.index(choice)
      str = color(choice, 31 + index)
      print "[#{str}] "
    end
    assessment[0].times { print black("b") }
    assessment[1].times { print white("w") }
    puts
  end
  
  public
  def print_board
    @moves.each do |m|
      print_row(m, @secret.assess(m))
    end
    
    (@moves.length .. 12 - 1).each do 
      4.times { print "[ ] "}
      puts
    end
  end
  
  # Answers whether the move made wins the game
  # `move` is a Code
  def make_move(move)
    @moves << move
    @secret.assess(move)[0] == 4 # wins when 4 pieces of right color in right position
  end
  
  # Answers whether all places on the board have been used up
  def full
    @moves.length >= 12
  end
  
  private
  def random_code
    s = ""
    4.times { s += CHOICES[rand(6)] }
    Code.new s
  end
  
end