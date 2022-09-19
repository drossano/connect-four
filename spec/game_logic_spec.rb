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
        allow(board).to receive(:column_full?).with(3).and_return(true)
      end
      it 'returns an error message' do
        full_column = 3
        verified_input = game_verify.verify_input(full_column)
        expect(verified_input).to eq('This column is full, please choose another column.')
      end
    end
  end

  describe "#player_input" do
    subject(:game_turn) { described_class.new }
    context 'when a valid input is entered' do
      before do
        allow(game_turn).to receive(:puts)
        valid_column = '3'
        allow(game_turn).to receive(:gets).and_return(valid_column)
      end
      it 'ends the loop and sends the move to the board' do
        board = game_turn.instance_variable_get(:@board)
        expect(board).to receive(:drop_piece).with(2, 'white')
        game_turn.player_input('white', 1)
      end
    end

    context 'when an invalid input is entered and then a valid input' do
      before do
        allow(game_turn).to receive(:puts)
        valid_column = '3'
        invalid_column = '10'
        allow(game_turn).to receive(:gets).and_return(invalid_column, valid_column)
      end
      it 'returns an error message once then ends the loop and sends the move to the board' do
        board = game_turn.instance_variable_get(:@board)
        error_message = 'Invalid input. Please enter a number between 1 and 7.'
        expect(game_turn).to receive(:puts).with(error_message)
        expect(board).to receive(:drop_piece).with(2, 'white')
        game_turn.player_input('white', 1)
      end
    end

    context 'when a full column is entered and then a valid input' do
      before do
        board = game_turn.instance_variable_get(:@board)
        board.board_array[3] = ['⚫', '⚪', '⚪', '⚪', '⚫', '⚫']
        allow(game_turn).to receive(:puts)
        valid_column = '3'
        full_column = '4'
        allow(game_turn).to receive(:gets).and_return(full_column, valid_column)
      end
      it 'returns an error message once then ends the loop and sends the move to the board' do
        board = game_turn.instance_variable_get(:@board)
        error_message = 'This column is full, please choose another column.'
        expect(game_turn).to receive(:puts).with(error_message)
        expect(board).to receive(:drop_piece).with(2, 'white')
        game_turn.player_input('white', 1)
      end
    end

    context 'when a full column is entered, an invalid column is entered and then a valid input' do
      before do
        board = game_turn.instance_variable_get(:@board)
        board.board_array[3] = ['⚫', '⚪', '⚪', '⚪', '⚫', '⚫']
        allow(game_turn).to receive(:puts)
        valid_column = '3'
        full_column = '4'
        invalid_column = '10'
        allow(game_turn).to receive(:gets).and_return(full_column, invalid_column, valid_column)
      end
      it 'returns an error message once then ends the loop and sends the move to the board' do
        board = game_turn.instance_variable_get(:@board)
        full_error_message = 'This column is full, please choose another column.'
        invalid_error_message = 'Invalid input. Please enter a number between 1 and 7.'
        expect(game_turn).to receive(:puts).with(full_error_message)
        expect(game_turn).to receive(:puts).with(invalid_error_message)
        expect(board).to receive(:drop_piece).with(2, 'white')
        game_turn.player_input('white', 1)
      end
    end
  end
end