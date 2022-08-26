require_relative '../lib/player'
require_relative '../lib/board'

describe Player do
  subject(:player_input) { described_class.new }
  let(:board_input) { instance_double(Board)}
  describe '#input' do
    context 'when a valid input is entered' do
      before do
        valid_input = '3'
        allow(player_input).to receive(:gets).and_return(valid_input)
      end
      it 'stops the loop and does not display an error message' do
        error_message = "Invalid input. Please enter a number bewteen 1 and 7."
        allow(board_input).to receive(:board_array).and_return(Array.new(7) { Array.new(6, ' ') })
        array = board_input.board_array
        expect(player_input).not_to receive(:puts).with(error_message)
        player_input.input(array)
      end
    end
  end
end