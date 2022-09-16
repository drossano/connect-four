require_relative '../lib/game_logic'
require_relative '../lib/board'
describe GameLogic do
  describe '#verify_input' do
    subject(:game_verify) { described_class.new }
    let(:board_verify) { instance_double(Board) }
    context 'when given a valid, non-full column an input' do
      it 'returns true' do
        valid_column = 3
        verified_input = game_verify.verify_input(valid_column)
        expect(verified_input).to be true
      end
    end
    context 'when given an invalid input' do
      it 'returns an error message' do
        invalid_column = 8
        verified_input = game_verify.verify_input(invalid_column)
        expect(verified_input).to eq('Invalid input. Please enter a number between 1 and 7.')
      end
    end
    context 'when a given a full column' do
      before do
        board = game_verify.instance_variable_get(:@board)
        allow(board).to receive(:column_full?).with(board.board_array[3]).and_return(true)
      end
      it 'returns an error message' do
        full_column = 3
        verified_input = game_verify.verify_input(full_column)
        expect(verified_input).to eq('This column is full, please choose another column.')
      end
    end
  end

  describe "#player_turn" do
    let(:board_turn) { instance_double(Board) }
    subject(:game_turn) { described_class.new }
    context 'when a valid input is entered' do
      before do
        allow(game_turn).to receive(:puts)
        valid_column = 3
        allow(game_turn).to receive(:verify_input).with(valid_column).and_return true
      end
      it 'ends the loop and sends the move to the board' do
        expect(board_turn).to receive(:drop_piece).with('white', 2)
        game_turn.player_turn('white')
      end
    end
  end
  
end