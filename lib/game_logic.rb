require_relative 'player'
require_relative 'board'

class GameLogic
  def initialize
    @board = Board.new
    @player1 = Player.new('white')
    @player2 = Player.new('black')
  end

  def verify_input(input)
    if input.between?(0,@board.board_array.length() - 1) && @board.column_full?(@board.board_array[input]) == false
      true
    elsif input.between?(0,@board.board_array.length() - 1) == false
      'Invalid input. Please enter a number between 1 and 7.'
    elsif @board.column_full?(@board.board_array[input]) == true
      'This column is full, please choose another column.'
    end
  end
end
