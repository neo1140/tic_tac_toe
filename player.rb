# class for the players
class Player
  @@num_of_players = 0
  attr_accessor :num_of_players, :player_value, :name
  def initialize(name)
    @name = name
    if @@num_of_players == 0
      @player_value = 'X'
    else
      @player_value = 'O'
    end
    @@num_of_players += 1
  end
  def to_s
    "Players: #{@@num_of_players} #{@player_value} player is #{name}"
  end
end

zach = Player.new('zach')
anna = Player.new('anna')
puts zach
puts anna
