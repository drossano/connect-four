# frozen_string_literal: true
# Stores, manipulates and displays game board.
class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(7) { Array.new(6, '  ') }
    @black_piece = '⚫'
    @white_piece = '⚪'
  end

  def draw_board(array)
    '  1   2   3   4   5   6   7  ' + "\n" +
    '┌────┬────┬────┬────┬────┬────┬────┐' + "\n" +
    "│ #{array[0][0]} │ #{array[1][0]} │ #{array[2][0]} │ #{array[3][0]} │ #{array[4][0]} │ #{array[5][0]} │ #{array[6][0]} │" + "\n" +
    "├────┼────┼────┼────┼────┼────┼────┤" + "\n" +
    "│ #{array[0][1]} │ #{array[1][1]} │ #{array[2][1]} │ #{array[3][1]} │ #{array[4][1]} │ #{array[5][1]} │ #{array[6][1]} │" + "\n" +
    "├────┼────┼────┼────┼────┼────┼────┤" + "\n" +
    "│ #{array[0][2]} │ #{array[1][2]} │ #{array[2][2]} │ #{array[3][2]} │ #{array[4][2]} │ #{array[5][2]} │ #{array[6][2]} │" + "\n" +
    "├────┼────┼────┼────┼────┼────┼────┤" + "\n" +
    "│ #{array[0][3]} │ #{array[1][3]} │ #{array[2][3]} │ #{array[3][3]} │ #{array[4][3]} │ #{array[5][3]} │ #{array[6][3]} │" + "\n" +
    "├────┼────┼────┼────┼────┼────┼────┤" + "\n" +
    "│ #{array[0][4]} │ #{array[1][4]} │ #{array[2][4]} │ #{array[3][4]} │ #{array[4][4]} │ #{array[5][4]} │ #{array[6][4]} │" + "\n" +
    "├────┼────┼────┼────┼────┼────┼────┤" + "\n" +
    "│ #{array[0][5]} │ #{array[1][5]} │ #{array[2][5]} │ #{array[3][5]} │ #{array[4][5]} │ #{array[5][5]} │ #{array[6][5]} │" + "\n" +
    '└────┴────┴────┴────┴────┴────┴────┘'
  end

  def column_full?(column)
    @board_array[column].none?("  ")
  end

  def column_empty?(column)
    @board_array[column].all?("  ")
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
        @board_array[column].shift
        @board_array[column].push(piece)
      else
        first_empty_space = @board_array[column].rindex("  ")
        @board_array[column][first_empty_space] = piece
      end
    else
      false
    end
  end

  def column_win(board_array)
    board_array.any? do |column|
      column.each_cons(4).any? do |group|
        if group.include?('  ')
          false
        else
          true
        end
      end
    end
  end

  def row_win(board_array)
    column_win(board_array.transpose)
  end
  
  def diagonal_to_row(array)
    grouped_diags = []
    column_to_hash(array[0]).map do |index, element|
      diag_array = []
      column_pos = 0
      row_pos = index
      until array[column_pos][row_pos].nil? || row_pos < 0
        diag_array.push(array[column_pos][row_pos])
        column_pos += 1
        row_pos -= 1
      end
      grouped_diags.push(diag_array)
    end
    column_to_hash(array[0]).map do |index, element|
      diag_array = []
      column_pos = 0
      row_pos = index
      until array[column_pos][row_pos].nil? || row_pos < 0
        diag_array.push(array[column_pos][row_pos])
        column_pos += 1
        row_pos += 1
      end
      grouped_diags.push(diag_array)
    end
    column_to_hash(array[6]).map do |index, element|
      diag_array = []
      column_pos = 0
      row_pos = index
      until array[column_pos][row_pos].nil? || row_pos < 0
        diag_array.push(array[column_pos][row_pos])
        column_pos -= 1
        row_pos -= 1
      end
      grouped_diags.push(diag_array)
    end
    column_to_hash(array[6]).map do |index, element|
      diag_array = []
      column_pos = 0
      row_pos = index
      until array[column_pos][row_pos].nil? || row_pos < 0
        diag_array.push(array[column_pos][row_pos])
        column_pos -= 1
        row_pos += 1
      end
      grouped_diags.push(diag_array)
    end
    grouped_diags.select { |group| group.length >= 4 }
  end

  def column_to_hash(array)
    column_hash = {}
    index = 0
    array.each do |element|
      column_hash[index] = element
      index += 1
    end
    column_hash
  end

  def diagonal_win(array)
    column_win(diagonal_to_row(array))
  end
end
