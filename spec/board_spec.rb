require_relative '../lib/board'

describe Board do
  describe '#draw_board' do
    context 'when the board is empty' do
      it 'shows an empty board' do
        expect(subject.draw_board).to eq(
        ' 1 2 3 4 5 6 7 ' + "\n" +
        '┌─┬─┬─┬─┬─┬─┬─┐' + "\n" +
        '│ │ │ │ │ │ │ │' + "\n" +
        '├─┼─┼─┼─┼─┼─┼─┤' + "\n" +
        '│ │ │ │ │ │ │ │' + "\n" +
        '├─┼─┼─┼─┼─┼─┼─┤' + "\n" +
        '│ │ │ │ │ │ │ │' + "\n" +
        '├─┼─┼─┼─┼─┼─┼─┤' + "\n" +
        '│ │ │ │ │ │ │ │' + "\n" +
        '├─┼─┼─┼─┼─┼─┼─┤' + "\n" +
        '│ │ │ │ │ │ │ │' + "\n" +
        '├─┼─┼─┼─┼─┼─┼─┤' + "\n" +
        '│ │ │ │ │ │ │ │' + "\n" +
        '└─┴─┴─┴─┴─┴─┴─┘')
      end
    end
  end
end