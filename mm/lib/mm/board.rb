class Board
  
  CHOICES = "RGYBMC"
  
  def initialize
    @secret = random_code
    @moves = []
  end 
  
  private
  def row_view(move, assessment)
    row = ""
    symbols = move.symbols
    symbols.each do |s| 
      choice = s.to_s
      index = CHOICES.index(choice)
      str = color(choice, 31 + index)
      row += "[#{str}] "
    end
    assessment[0].times { row += black("b") }
    assessment[1].times { row += white("w") }
    row
  end
  
  public
  def print_board
    lines = board_view
    lines.each do |l|
      puts l
    end
  end
  
  def board_view
    lines = []
    @moves.each do |m|
      lines << row_view(m, @secret.assess(m))
    end
    
    (@moves.length .. 12 - 1).each do 
      s = ""
      4.times { s += "[ ] "}
      lines << s
    end
    lines
  end
  
  # Answers whether the move made wins the game
  # `move` is a Code
  def make_move(move)
    @moves << move
  end
  
  # Answers whether all places on the board have been used up
  def full
    @moves.length >= 12
  end
  
  def wins?
    latest_move = @moves[-1]
    !latest_move.nil? && @secret.assess(latest_move)[0] == 4 # wins when 4 pieces of right color in right position
  end
  
  private
  def random_code
    s = ""
    4.times { s += CHOICES[rand(6)] }
    Code.new s
  end
  
end