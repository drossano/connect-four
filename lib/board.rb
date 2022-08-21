class Board

  attr_reader :board_array

  def initiaize
    @board_array = Array.new(6){ Array.new(7, " ")}
  end

  def draw_board(array)
    '  1   2   3   4   5   6   7  ' + "\n" +
    '┌───┬───┬───┬───┬───┬───┬───┐' + "\n" +
    "│   │   │   │   │   │   │   │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│   │   │   │   │   │   │   │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│   │   │   │   │   │   │   │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│   │   │   │   │   │   │   │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│   │   │   │   │   │   │   │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│   │   │   │   │   │   │   │" + "\n" +
    "└───┴───┴───┴───┴───┴───┴───┘"
  end
end

board = Board.new

puts board.draw_board([2])