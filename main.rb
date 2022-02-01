require './game.rb'
require './player.rb'

print "Player 1, please enter your name: "
player1_name = gets.chomp
print "Player 2, please enter your name: "
player2_name = gets.chomp

p1 = Player.new(player1_name)
p2 = Player.new(player2_name)

game = Game.new(p1, p2)
game.generate_question
