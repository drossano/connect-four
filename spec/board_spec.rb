require_relative '../lib/board'

describe Board do
  subject(:game_board) { described_class.new }
  describe '#initialize' do
    it 'creates a 2D array of 6 arrays containing 7 sstring spaces' do
      expect(subject.initiaize).to eq([[" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "], 
        [" ", " ", " ", " ", " ", " ", " "]])
    end
  end

  describe '#draw_board' do
    context 'when the board is empty' do
      it 'shows an empty board' do
        #array = game_board.instance_variable_get(:@board_array)
        expect(game_board.draw_board(game_board.board_array)).to eq(
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
  end
end