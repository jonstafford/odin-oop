class Board
  
  CHOICES = "RGYBMC"
  
  def initialize
    @secret =  random_code
    @moves = []
  end 
  
  private
  def print_row(symbols)
    symbols.each do |s|
      str = 
      if (s.nil?)
        " "
      else
        choice = s.to_s
        index = CHOICES.index(choice)
        color(choice, 31 + index)
      end
      print "[#{str}]"
    end
    puts
  end
  
  public
  def print_board
    @moves.each do |m|
      print_row m.symbols
    end
    
    (@moves.length .. 12 - 1).each do 
      row = []
      4.times {row << nil}
      print_row row 
    end
  end
  
  # Answers whether the move made wins the game
  # `move` is a Code
  def make_move(move)
    @moves << move
    false
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