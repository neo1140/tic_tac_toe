require_relative 'player'
require_relative 'board'
#class with game methods
class Game
  attr_reader :player1, :player2
  def initialize
    puts 'Welcome to tic-tac-toe! enter your player name!'
    @player1 = Player.new(gets.chomp)
    puts "Sweet! #{player1.name} you're playing X's! who's going to play O's?"
    @player2 = Player.new(gets.chomp)
    puts 'Awesome! Have fun you two!!'
    @board = Board.new
    @board.build_board
    player1_turn
  end

  def is_valid?(choice)
    if @board.positions[choice] == ' '
      true
    else
      false
    end
  end

  def player1_turn
    puts "#{player1.name} Choose where you would like to go in the grid!"
    choice = gets.chomp.to_i
    if is_valid?(choice)
      @board.update(choice, player1.player_value)
      player2_turn
    else
      puts 'Invalid selection, please try again!'
      @board.display
      player1_turn
    end
  end

  def player2_turn
    puts "#{player2.name} Choose where you would like to go in the grid!"
    choice = gets.chomp.to_i
    if is_valid?(choice)
      @board.update(choice, player2.player_value)
      player1_turn
    else
      puts 'Invalid selection, please try again!'
      @board.display
      player2_turn
    end
  end
end
game = Game.new
