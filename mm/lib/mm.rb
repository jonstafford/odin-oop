require_relative 'mm/code'
require_relative 'mm/board'
require_relative 'mm/colors'
require_relative 'mm/instructions'

include Colors

def get_move
  INSTRUCTIONS.each { |l| puts l }
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
  
  board.make_move(move)
  
  break if board.full || board.wins?
end

board.print_board