require_relative '../lib/board'


describe Board do
  subject(:game_board_array) { described_class.new }
  describe '#initialize' do
    it 'creates a 2D array of 7 arrays containing 6 string spaces' do
      expect(game_board_array.board_array).to eq([[" ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " "]])
    end
  end

  describe '#draw_board' do
    subject(:draw_game_board) { described_class.new }
    context 'when the board array is empty' do
      it 'shows an empty board' do
        expect(draw_game_board.draw_board(draw_game_board.board_array)).to eq(
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
          "└───┴───┴───┴───┴───┴───┴───┘")
      end
    end

    context 'when the board array contains values' do
      it 'displays those values in the correct spaces' do
        piece = draw_game_board.instance_variable_get(:@black_piece)
        filled_array = [[" ", " ", " ", " ", " ", piece],
        [" ", " ", " ", " ", piece, piece],
        [" ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " "],
        [" ", " ", " ", " ", " ", " "]]

        expect(draw_game_board.draw_board(filled_array)).to eq(
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
          "│   │ #{piece} │   │   │   │   │   │" + "\n" +
          "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
          "│ #{piece} │ #{piece} │   │   │   │   │   │" + "\n" +
          "└───┴───┴───┴───┴───┴───┴───┘"
        )
      end
    end
  end

  describe '#column_full?' do
    subject(:filling_board) { described_class.new }
    context 'when the specified column isnt full' do
      it 'returns false' do
        piece = filling_board.instance_variable_get(:@black_piece)
        non_full_column = [" ", " ", " ", " ", piece, piece]
        expect(filling_board.column_full?(non_full_column)).to be false
      end
    end

    context 'when the specified column is full' do
      it 'returns true' do
        piece = filling_board.instance_variable_get(:@black_piece)
        non_full_column = [piece, piece, piece, piece, piece, piece]
        expect(filling_board.column_full?(non_full_column)).to be true
      end
    end
  end

  describe '#drop_piece' do
    subject(:dropping_piece) { described_class.new}
    context 'when the column is empty and its the black pieces turn' do
      column = Array.new(6, ' ')
      before do
        allow(dropping_piece).to receive(:column_empty?).with(column).and_return(true)
        dropping_piece.drop_piece(column, "black")
      end
      it 'places a black piece at the bottom of it' do
        black_piece = dropping_piece.instance_variable_get(:@black_piece)
        expect(column).to eq([" ", " ", " ", " ", " ", black_piece])
      end
    end
    context 'when the column is empty and its the white pieces turn' do
      column = Array.new(6, ' ')
      before do
        allow(dropping_piece).to receive(:column_empty?).with(column).and_return(true)
        dropping_piece.drop_piece(column, "white")
      end
      it 'places a black piece at the bottom of it' do
        white_piece = dropping_piece.instance_variable_get(:@white_piece)
        expect(column).to eq([" ", " ", " ", " ", " ", white_piece])
      end
    end

    context 'when the column has one piece in it' do
      it 'drops the new piece on top of the existing piece' do
        white_piece = dropping_piece.instance_variable_get(:@white_piece)
        black_piece = dropping_piece.instance_variable_get(:@black_piece)
        column = [" ", " ", " ", " ", " ", black_piece]
        allow(dropping_piece).to receive(:column_empty?).with(column).and_return(false)
        dropping_piece.drop_piece(column, "white")
        expect(column).to eq([" ", " ", " ", " ", white_piece, black_piece])
      end
    end

    context 'when the column has three pieces in it' do
      it 'drops the new piece on top of the existing pieces' do
        white_piece = dropping_piece.instance_variable_get(:@white_piece)
        black_piece = dropping_piece.instance_variable_get(:@black_piece)
        column = [" ", " ", " ", black_piece, white_piece, black_piece]
        allow(dropping_piece).to receive(:column_empty?).with(column).and_return(false)
        dropping_piece.drop_piece(column, "white")
        expect(column).to eq([" ", " ", white_piece, black_piece, white_piece, black_piece])
      end
    end

    context 'when the column is full' do
      it 'returns an error' do
        black_piece = dropping_piece.instance_variable_get(:@black_piece)
        column = Array.new(6, black_piece)
        allow(dropping_piece).to receive(:column_full?).with(column).and_return(true)
        expect(dropping_piece.drop_piece(column, 'white')).to be false
      end
    end
  end
  
  describe '#column_win' do
    subject(:board_column) { described_class.new}
    context 'when the first column has four white pieces in a row' do
      it 'returns true' do
        array = board_column.board_array
        array[0] = ['⚪', '⚪', '⚪', '⚪', '⚫', '⚫']
        expect(board_column.column_win(array)).to be true
      end
    end

    context 'when the third column has four black pieces in a row' do
      it 'returns true' do
        array = board_column.board_array
        array[2] = ['⚪', '⚪', '⚫', '⚫', '⚫', '⚫']
        expect(board_column.column_win(array)).to be true
      end
    end

    context 'when there are no pieces' do
      it 'returns false' do
        array = board_column.board_array
        expect(board_column.column_win(array)).to be false
      end
    end
  end

  describe '#row_win' do
    subject(:board_row) { described_class.new}
    context 'when the first row has four white pieces in a row' do
      it 'returns true' do
        array = board_row.board_array
        array[0][0] = '⚪'
        array[1][0] = '⚪'
        array[2][0] = '⚪'
        array[3][0] = '⚪'
        array[4][0] = '⚫'
        array[5][0] = '⚫'
        array[6][0] = '⚪'
        expect(board_row.row_win(array)).to be true
      end
    end

    context 'when the third row has four black pieces in a row' do
      it 'returns true' do
        array = board_row.board_array
        array[0][2] = '⚪'
        array[1][2] = '⚪'
        array[2][2] = '⚫'
        array[3][2] = '⚫'
        array[4][2] = '⚫'
        array[5][2] = '⚫'
        array[6][2] = '⚪'
        expect(board_row.row_win(array)).to be true
      end
    end

    context 'when there are no pieces' do
      it 'returns false' do
        array = board_row.board_array
        expect(board_row.row_win(array)).to be false
      end
    end
  end

  describe '#column_to_hash' do
    subject(:column_hash) { described_class.new }
    context 'when the first column has no pieces' do
      it 'returns a hasn with the key being the index of the respective element' do
        column = column_hash.board_array[0]
        expect(column_hash.column_to_hash(column)).to eq( {0 => ' ', 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ' })
      end
    end
    context 'when the first column has pieces' do
      it 'returns a hasn with the key being the index of the respective element' do
        column = ['⚪', '⚪', '⚪', '⚪', '⚫', '⚫']

        expect(column_hash.column_to_hash(column)).to eq( {0 => '⚪', 1 => '⚪', 2 => '⚪', 3 => '⚪', 4 => '⚫', 5 => '⚫' })
      end
    end
  end

  describe '#diagonal_to_row' do
    subject(:diag_rows) { described_class.new }
    it 'returns all diagonals with four or more spaces as separate  2D arrays with 4' do
      array = diag_rows.board_array
      expect(diag_rows.diagonal_to_row(array)).to eq(
        [[' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '],
         [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' '],
         [' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '],
         [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ']]
      )
    end
  end

  describe '#diagonal_win' do
    subject(:board_diagonal) { described_class.new }
    context 'when 0,0 to 3,3 has four white pieces in a row' do
      it 'returns true' do
        array = board_diagonal.board_array
        array[0][0] = '⚪'
        array[1][1] = '⚪'
        array[2][2] = '⚪'
        array[3][3] = '⚪'
        array[4][4] = '⚫'
        array[5][5] = '⚫'
        expect(board_diagonal.diagonal_win(array)).to be true
      end
    end
    context 'when 0,5 to 3,2 has four white pieces in a row' do
      it 'returns true' do
        array = board_diagonal.board_array
        array[0][5] = '⚪'
        array[1][4] = '⚪'
        array[2][3] = '⚪'
        array[3][2] = '⚪'
        array[4][1] = '⚫'
        array[5][0] = '⚫'
        expect(board_diagonal.diagonal_win(array)).to be true
      end
    end
    context 'when there are no pieces' do
      it 'returns false' do
        array = board_diagonal.board_array
        expect(board_diagonal.diagonal_win(array)).to be false
      end
    end
  end
end