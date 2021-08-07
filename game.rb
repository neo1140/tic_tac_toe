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
    player1_turn
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
# turn method for player one, refactor the two turn methods into one?
  def player1_turn
    puts "#{player1.name} Choose where you would like to go in the grid!"
    choice = (gets.chomp.to_i - 1)
    if valid?(choice)
      @board.update(choice, player1.player_value)
      if victory?(player1)
        game_end(player1)
      elsif self.game_end_tie?
        self.game_end('tie')
      else
      player2_turn
      end
    else
      puts 'Invalid selection, please try again!'
      @board.display
      player1_turn
    end
  end
# turn method for player two, refactor the two turn methods into one?
  def player2_turn
    puts "#{player2.name} Choose where you would like to go in the grid!"
    choice = (gets.chomp.to_i - 1)
    if valid?(choice)
      @board.update(choice, player2.player_value)
      if victory?(@player2)
        game_end(player2)
      elsif self.game_end_tie?
        self.game_end('tie')
      else
      player1_turn
      end
    else
      puts 'Invalid selection, please try again!'
      @board.display
      player2_turn
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
