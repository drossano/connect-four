require_relative 'player'
require_relative 'board'

class GameLogic
  def initialize
    @board = Board.new
    @player1 = Player.new('white', 1)
    @player2 = Player.new('black', 2)
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

  def player_input(color, number)
    loop do
      puts "Player #{number} enter the column that you would like to drop your piece."
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

  def player_turn(player)
    player_input(player.color, player.player_number)
    puts @board.draw_board(@board.board_array)
    puts "Congrats Player #{player.player_number}, you win!" if check_for_win == true
  end

  def check_for_win
    true if @board.column_win(@board.board_array) == true || @board.row_win(@board.board_array) == true || @board.diagonal_win(@board.board_array) == true
  end

  def play_game
    puts 'Welcome to Connect 4!'
    puts @board.draw_board(@board.board_array)
    loop do
      player_turn(@player1)
      break if check_for_win == true
      player_turn(@player2)
      break if check_for_win == true
    end
  end
end
