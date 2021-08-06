require_relative 'player'
require_relative 'board.rb'

def restart_board
  board = Board.new
  board.build_board
end

def game(player1=nil, player2=nil)

  if player1 == nil
    puts 'Welcome to tic-tac-toe! enter your player name!'
    player1 = Player.new(gets.chomp)
    puts "Sweet! #{player1.name} you're playing X's! who's going to play O's?"
    player2 = Player.new(gets.chomp)
    puts 'Awesome! Have fun you two!!'
    board = Board.new
    board.build_board
    board.update(0, player1.player_value)
  else
    player1, player2 = player2, player1
    puts "Another round? this time #{player1.name} is on X's!"
    restart_board
  end

  puts 'Good game! enter "Y" if you want to play again!'
  if gets.chomp.downcase == 'y'
    game(player1, player2)
  else
    puts 'Thanks for playing!'
  end
end
game
