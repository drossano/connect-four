# frozen_string_literal: true

# Stores, manipulates and displays game board.
class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(6) { Array.new(7, ' ') }
  end

  def draw_board(array)
    '  1   2   3   4   5   6   7  ' + "\n" +
    '┌───┬───┬───┬───┬───┬───┬───┐' + "\n" +
    "│ #{array[0][0]} │   │   │   │   │   │   │" + "\n" +
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
    '└───┴───┴───┴───┴───┴───┴───┘'
  end
end