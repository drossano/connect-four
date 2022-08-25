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
end