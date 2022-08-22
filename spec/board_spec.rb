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

  describe '#update_board' do
    subject(:updating_board) { described_class.new }
    context 'when a valid index is given with the color white' do
      before do
        array = updating_board.board_array
        row_index = 4
        column_index = 3
        color = 'white'
        updating_board.update_board(array, row_index, column_index, color)
      end

      it 'updates that value' do
        expect(updating_board.board_array).to eq([[" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", updating_board.white_piece, " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "]])
      end
    end

    context 'when a valid index is given with the color black' do
      before do
        array = updating_board.board_array
        row_index = 2
        column_index = 0
        color = 'black'
        updating_board.update_board(array, row_index, column_index, color)
      end

      it 'updates that value' do
        expect(updating_board.board_array).to eq([[" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "], 
          [updating_board.black_piece, " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "], 
          [" ", " ", " ", " ", " ", " ", " "]])
      end
    end
  end
end