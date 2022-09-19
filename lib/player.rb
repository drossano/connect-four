class Player
  attr_reader :color
  attr_reader :player_number

  def initialize(color, player_number)
    @color = color
    @player_number = player_number
  end
end