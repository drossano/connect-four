# frozen_string_literal: true

# Stores, manipulates and displays game board.
class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(7) { Array.new(6, ' ') }
    @black_piece = '⚫'
    @white_piece = '⚪'
  end

  def draw_board(array)
    '  1   2   3   4   5   6   7  ' + "\n" +
    '┌───┬───┬───┬───┬───┬───┬───┐' + "\n" +
    "│ #{array[0][0]} │ #{array[1][0]} │ #{array[2][0]} │ #{array[3][0]} │ #{array[4][0]} │ #{array[5][0]} │ #{array[6][0]} │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│ #{array[0][1]} │ #{array[1][1]} │ #{array[2][1]} │ #{array[3][1]} │ #{array[4][1]} │ #{array[5][1]} │ #{array[6][1]} │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│ #{array[0][2]} │ #{array[1][2]} │ #{array[2][2]} │ #{array[3][2]} │ #{array[4][2]} │ #{array[5][2]} │ #{array[6][2]} │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│ #{array[0][3]} │ #{array[1][3]} │ #{array[2][3]} │ #{array[3][3]} │ #{array[4][3]} │ #{array[5][3]} │ #{array[6][3]} │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│ #{array[0][4]} │ #{array[1][4]} │ #{array[2][4]} │ #{array[3][4]} │ #{array[4][4]} │ #{array[5][4]} │ #{array[6][4]} │" + "\n" +
    "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
    "│ #{array[0][5]} │ #{array[1][5]} │ #{array[2][5]} │ #{array[3][5]} │ #{array[4][5]} │ #{array[5][5]} │ #{array[6][5]} │" + "\n" +
    '└───┴───┴───┴───┴───┴───┴───┘'
  end

  def column_full?(column)
    column.none?(" ")
  end

  def column_empty?(column)
    column.all?(" ")
  end

  def pick_piece(color)
    if color == 'black'
      @black_piece
    else
      @white_piece
    end
  end

  def drop_piece(column, color)
    piece = pick_piece(color)
    unless column_full?(column)
      if column_empty?(column)
        column.shift
        column.push(piece)
      else
        first_empty_space = column.rindex(" ")
        column[first_empty_space] = piece
      end
    else
      false
    end
  end

  def column_win(board_array)
    board_array.any? do |column|
      column.each_cons(4).any? do |group|
        if group.include?(' ')
          false
        else
          true
        end
      end
    end
  end
end
