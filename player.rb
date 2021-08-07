# class for the players
class Player
  @@num_of_players = 0
  attr_reader :num_of_players, :player_value, :name

  def initialize(name)
    @name = name
    @player_value = if @@num_of_players.even?
                      'X'
                    else
                      'O'
                    end
    @@num_of_players += 1
  end
end
