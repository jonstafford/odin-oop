require "./lib/ttt/board.rb"
require "test/unit"

class TestBoard < Test::Unit::TestCase

  def test_move_to_row
    assert_equal(0, Board.move_to_row(1))
    assert_equal(0, Board.move_to_row(2))
    assert_equal(0, Board.move_to_row(3))
            
    assert_equal(1, Board.move_to_row(4))
    assert_equal(1, Board.move_to_row(5))
    assert_equal(1, Board.move_to_row(6))
    
    assert_equal(2, Board.move_to_row(7))
    assert_equal(2, Board.move_to_row(8))
    assert_equal(2, Board.move_to_row(9))
  end

  def test_move_to_column
    assert_equal(0, Board.move_to_column(1))
    assert_equal(1, Board.move_to_column(2))
    assert_equal(2, Board.move_to_column(3))
            
    assert_equal(0, Board.move_to_column(4))
    assert_equal(1, Board.move_to_column(5))
    assert_equal(2, Board.move_to_column(6))
    
    assert_equal(0, Board.move_to_column(7))
    assert_equal(1, Board.move_to_column(8))
    assert_equal(2, Board.move_to_column(9))
  end

end