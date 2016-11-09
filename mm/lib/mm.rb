require_relative 'mm/code'
require_relative 'mm/board'
require_relative 'mm/colors'

include Colors

def get_move
  puts "Specify the four colors for your move. For example 'RRCP'."
  puts red("R") + " = " + red("Red") + ", " +
    green("G") + " = " + green("Green") + ", " + 
    yellow("Y") + " = " + yellow("Yellow") + ", " + 
    blue("B") + " = " + blue("Blue") + ", " + 
    magenta("M") + " = " + magenta("Magenta") + ", " + 
    cyan("C") + " = " + cyan("Cyan")
  loop do
    str = gets.chomp.strip
    return Code.new(str) if str =~ /[RGYBMC]{4}/i
    puts "INVALID MOVE"
  end 
end



board = Board.new

loop do
  board.print_board
  
  move = get_move
  
  wins = board.make_move(move)
  
  break if board.full || wins
end

board.print_board