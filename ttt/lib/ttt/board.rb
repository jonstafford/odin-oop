class Board
  
  def self.move_to_row(move)
    (move - 1) / 3
  end
  
  def self.move_to_column(move)
    (move - 1) % 3
  end
  
  def available_positions
    result = []
    position = 1
    @state.each do |i|
      i.each do |j|
        result << position if j == :e
        position += 1
      end
    end
    
    result
  end
  
  def initialize
    @state = [[:e, :e, :e], [:e, :e, :e], [:e, :e, :e]]
  end
  
  def intro
    puts "Welcome to tic-tac-toe!"
    puts "Players O and X alternate moves."
    puts "When it's your turn, press a key from 1-9 to choose where to put your move."
    
    print_board
  end
  
  def make_move(move)
    
    # apply the move, next_mover (:x or :o) goes into position `move`
    wins = apply_move(move)
    
    print_board
    
    result =
      if !wins.nil?
        # winner must be opposite of whoever has next move
        result = displayable_symbol(wins) + " WINS!" 
      elsif available_positions.size <= 0
        result = "DRAW!"
      else
        result = nil
      end
       
    # Answers if the board is done (someone has won or it's full)
    return result
  end
  
  private
  def displayable_symbol(player)
    player.to_s.upcase
  end
  
  def print_board

    puts "Next player to move is " + displayable_symbol(next_mover)

    rows = [["", "", "", "", ""], ["", "", "", "", ""], ["", "", "", "", ""]]
    @state.each_with_index do |row, i|
      
      5.times do |k|
        rows[i][k] += " | " # Left border of game board
      end
      
      row.each_with_index do |cell, j|
        if cell == :e
          rows[i][0] += " " * 5
          rows[i][1] += " " * 5
          rows[i][2] += "  " +  (i * 3 + j + 1).to_s + "  "
          rows[i][3] += " " * 5
          rows[i][4] += " " * 5
        elsif cell == :o
          rows[i][0] += " ooo "
          rows[i][1] += "o   o"
          rows[i][2] += "o   o"
          rows[i][3] += "o   o"
          rows[i][4] += " ooo "
        else
          rows[i][0] += "x   x"
          rows[i][1] += " x x "
          rows[i][2] += "  x  "
          rows[i][3] += " x x "
          rows[i][4] += "x   x"
        end
        
        5.times do |k|
          rows[i][k] += " | "
        end
      end
      
    end
    
    puts # Blank line at the start
    hr = "+-----------------------+"
    puts " " + hr # Top border
    
    all_rows = rows[0] + [" " + hr] + rows[1] + [" " + hr] + rows[2]
    all_rows.each { |line| puts line }
    
    puts " " + hr # Bottom border
    
    puts # Blank line at the end
  end
  
  
  def next_mover
    available_positions.size % 2 == 0 ? :x : :o
  end
  
  
  def row_wins(row)
    return false if @state[row][0] == :e
    return true if @state[row][0] == @state[row][1] && @state[row][1] == @state[row][2] 
    return false
  end
  
  def column_wins(column)
    return false if @state[0][column] == :e
    return true if @state[0][column] == @state[1][column] && @state[1][column] == @state[2][column] 
    return false
  end
  
  def diagonal_wins
    return false if @state[1][1] == :e
    return true if @state[0][0] == @state[1][1] && @state[1][1] == @state[2][2] 
    return true if @state[2][0] == @state[1][1] && @state[1][1] == @state[0][2] 
    return false
  end
  
  # Answers winning side if there is one
  def apply_move(move)

    i = self.class.move_to_row(move)
    j = self.class.move_to_column(move)
    
    player = next_mover
    @state[i][j] = player
    
    if (row_wins(i) || column_wins(j) || diagonal_wins)
      return player
    else
      return nil
    end
  end
  
end