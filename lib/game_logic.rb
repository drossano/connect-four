require_relative 'player'
require_relative 'board'

class GameLogic
  def initialize
    @board = Board.new
    @player1 = Player.new('white')
    @player2 = Player.new('black')
  end

  def verify_input(input)
    if input.between?(0,@board.board_array.length()) && @board.column_full?(@board.board_array[input]) == false
      true
    elsif input.between?(0,@board.board_array.length()) == false
      'Invalid input. Please enter a number between 1 and 7.'
    elsif @board.column_full?(@board.board_array[input]) == true
      'This column is full, please choose another column.'
    end
  end

  def player_turn(color)
    loop do
      puts "Please enter the column that you would like to drop your piece."
      input = gets.chomp.to_i - 1
      verified_input = verify_input(input)
      if verified_input == true
        @board.drop_piece(input, color)
        break
      else
        puts verified_input
      end
    end
  end
end
