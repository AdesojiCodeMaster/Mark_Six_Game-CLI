require_relative '../lib/board'
class Game
  attr_reader :board, :players

  def initialize(new_players)
    @board = Board.new
    @players = new_players
  end

  def winner
    lucky_numbers = []
    6.times do
      lucky_numbers << 6.times.map { Random.rand(1..49) }
    end
    lucky_numbers.last
  end
end
