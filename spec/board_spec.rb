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
end