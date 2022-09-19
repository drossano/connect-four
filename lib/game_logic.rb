require_relative 'player'
require_relative 'board'

class GameLogic
  def initialize
    @board = Board.new
    @player1 = Player.new('white')
    @player2 = Player.new('black')
  end

  def verify_input(input)
    if input.between?(0, @board.board_array.length()) && @board.column_full?(input) == false
      true
    elsif input.between?(0, @board.board_array.length()) == false
      'Invalid input. Please enter a number between 1 and 7.'
    elsif @board.column_full?(input) == true
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

  def check_for_win
    if @board.column_win(@board.board_array) == true || @board.row_win(@board.board_array) == true || @board.diagonal_win(@board.board_array) == true
      true
    end
  end

  def play_game
    puts @board.draw_board(@board.board_array)
    loop do
      player_turn(@player1.color)
      puts @board.draw_board(@board.board_array)
      if check_for_win == true
        puts "Congrats Player 1, you win!"
        break
      end
      player_turn(@player2.color)
      puts @board.draw_board(@board.board_array)
      if check_for_win == true
        puts "Congrats Player 2, you win!"
        break
      end
    end
  end
end
