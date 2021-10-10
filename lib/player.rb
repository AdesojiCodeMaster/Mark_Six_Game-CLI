class Player
  attr_accessor :next_move
  attr_reader :name, :token, :ticket

  def initialize(name, token, ticket)
    @name = name
    @next_move = []
    @moves = []
    @token = token
    @ticket = ticket
  end

  def self.validate_name(new_name)
    new_name.to_s.length < 2 ? false : new_name
  end
end
