require_relative '../lib/player'
require_relative '../lib/board'

describe Player do
  subject(:player_input) { described_class.new }
  let(:board_input) { instance_double(Board)}
  describe '#input' do
    context 'when the input is not between 1 and 7' do
      before do
        invalid_input = "8"
        allow(player_input).to receive(:gets).and_return(invalid_input)
      end
      it 'returns an error message' do
        allow(board_input).to receive(:board_array).and_return(Array.new(7) { Array.new(6, ' ') })
        expect(player_input).to receive(:puts).with("Invalid input. Please try again.")
        player_input.input(board_input.board_array)
      end
    end
  end
end