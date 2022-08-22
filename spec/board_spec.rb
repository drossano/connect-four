require_relative '../lib/board'

describe Board do
  subject(:game_board_array) { described_class.new }
  describe '#initialize' do
    it 'creates a 2D array of 6 arrays containing 7 sstring spaces' do
      expect(game_board_array.board_array).to eq([[" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "]])
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
        filled_array = [[" ", " ", " ", " ", " ", " ", " "], 
        [" ", "O", "O", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", "O", "O", " ", " ", " ", " "], 
        [" ", "O", " ", " ", " ", " ", " "], 
        ["O", " ", " ", " ", " ", " ", " "]]

        expect(draw_game_board.draw_board(filled_array)).to eq(
          '  1   2   3   4   5   6   7  ' + "\n" +
          '┌───┬───┬───┬───┬───┬───┬───┐' + "\n" +
          "│   │   │   │   │   │   │   │" + "\n" +
          "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
          "│   │ O │ O │   │   │   │   │" + "\n" +
          "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
          "│   │   │   │   │   │   │   │" + "\n" +
          "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
          "│   │ O │ O │   │   │   │   │" + "\n" +
          "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
          "│   │ O │   │   │   │   │   │" + "\n" +
          "├───┼───┼───┼───┼───┼───┼───┤" + "\n" +
          "│ O │   │   │   │   │   │   │" + "\n" +
          "└───┴───┴───┴───┴───┴───┴───┘"
        )
      end
    end
  end
end