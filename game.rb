require_relative 'player'
require_relative 'board'
# class with game methods
class Game
  attr_reader :player1, :player2
  def initialize
    puts 'Welcome to tic-tac-toe! enter your player name!'
    @player1 = Player.new(gets.chomp)
    puts "Sweet! #{player1.name} you're playing X's! who's going to play O's?"
    @player2 = Player.new(gets.chomp)
    puts 'Awesome! Have fun you two!!'
    game_start
  end
# resets board state for new game
  def game_start
    @board = Board.new
    @board.build_board
    turn
  end
# starts a new game without requiring re-entering of usernames
  def new_game(player1, player2)
    @player1 = player2
    @player2 = player1
    puts "Another round? this time #{@player1.name} is going first! Hit enter to start!"
    gets
    game_start
  end
# checks to see if a users move is a valid one
  def valid?(choice)
    if @board.positions[choice] == ' ' && choice >= 0
      true
    else
      false
    end
  end
# turn method
  def turn(last_player=nil)
    current_player = @player2 if last_player == @player1
    current_player = @player1 if last_player == @player2
    current_player = @player1 if last_player == nil
    puts "#{current_player.name} Choose where you would like to go in the grid!"
    choice = (gets.chomp.to_i - 1)
    if valid?(choice)
      @board.update(choice, current_player.player_value)
      if victory?(current_player)
        game_end(current_player)
      elsif self.game_end_tie?
        self.game_end('tie')
      else
        turn(current_player)
      end
    end
  end
# check to see if the game has ended in a tie
  def game_end_tie?
    if @board.positions.include?(' ')
      return false
    else
      return true
    end
  end
# check to see if the game has ended in victory
  def victory?(player)
    false
    true if @board.win_states.include?(player.player_value * 3)
  end
# method to end the game if a game ending condition is met
  def game_end(condition)
    if condition == 'tie'
      puts "It's a tie! good game you two, enter 'y' if you want to play another round!"
      choice = gets.chomp
      if choice.chomp.downcase == 'y'
        self.new_game(player1, player2)
      else
        puts "Thanks for playing!"
      end
    else
      puts "#{condition.name} won! Want to play again? Enter 'y' if you do!"
      choice = gets.chomp
      if choice.chomp.downcase == 'y'
        self.new_game(player1, player2)
      else
        puts "Thanks for playing!"
      end
    end
  end
end
