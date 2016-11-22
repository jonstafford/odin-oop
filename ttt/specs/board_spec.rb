require './lib/ttt/board'

describe Board do
  describe "#row_wins" do
    let(:row_0_wins) do
      board = Board.new
      board.make_move(1)
      board.make_move(4)
      board.make_move(2)
      board.make_move(5)
      board.make_move(3)
      board
    end
    
    it "recognizes a winning top row" do
      expect(row_0_wins.row_wins(0)).to be true
    end
    
    it "recognizes a non winning row" do
      expect(row_0_wins.row_wins(2)).to be false
    end
  end
end
  