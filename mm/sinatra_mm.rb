require 'sinatra'

require 'sinatra/reloader' if development?

require './lib/mm/web_colors'
require './lib/mm/code'
require './lib/mm/board'
require './lib/mm/instructions'

include Colors

enable :sessions

get '/' do
  board = session[:board]
  
  if (board.nil?)
    board = Board.new
    session[:board] = board
  end
  
  board_view = board.board_view
  status = nil
  
  erb :index, :locals => { :instructions => INSTRUCTIONS, :status => status, :board_view => board_view}
end

get '/newgame' do
  session[:board] = nil
  redirect to("/")
end

post '/' do
  board = session[:board]

  if (board.full || board.wins?)
    session[:board] = nil
    redirect to("/")
  end
  
  guess = params["guess"]
  
  status = nil
  if guess =~ /[RGYBMC]{4}/i
    move = Code.new(guess) 
    board.make_move(move)
    
    if (board.wins?)
      status = "You won!"
    elsif (board.full)
      status = "You lost."
    end
  else
    status = "INVALID MOVE"
  end
  
  board_view = board.board_view
  
  erb :index, :locals => { :instructions => INSTRUCTIONS,  :status => status, :board_view => board_view}
end