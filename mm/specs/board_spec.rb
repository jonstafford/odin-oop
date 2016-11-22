require './lib/mm/board'
require './lib/mm/code'

describe Board do
  let(:board) do
    Board.new
  end
  
  describe "#make_move wins" do
    it "answers win when move made matches secret code" do
      code = Code.new("RRYC")
      
      # Force the secret_code to be something we know
      expect(Code).to receive(:new).and_return(code)

      expect(board.make_move(code)).to be true
    end
  end
end
       