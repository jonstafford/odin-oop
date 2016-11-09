require 'io/console'
require_relative 'ttt/board'

def get_player_move(possibles)
  move = nil
  while !possibles.include? move
    char = STDIN.getch
    if char == "\u0003"
      puts "Exiting..." 
      exit(1)
    end
    
    move = char.to_i
  end
  move
end

board = Board.new

board.intro

result = nil
while result.nil? do
  
  move = get_player_move(board.available_positions)
  
  result = board.make_move(move)
end

puts "Game over. " + result