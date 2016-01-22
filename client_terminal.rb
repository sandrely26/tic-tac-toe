require 'tic_tac_toe'
require 'pry'

puts "Welcome to tic tac toe\n"
#player one
puts "Set the name player-one: "
player1 = gets.chomp
puts "Your chip is X\n"
#player two
puts "Set the name player-two: "
player2 = gets.chomp
puts "Your chip is O\n"

#cargando juego....
@game = TicTacToe::Game.new


#hacer un ciclo hasta que el metodo
#set_position devuleva un false.
def ask_position_to_player
  puts "Enter your coordinates\n"
  puts "Range between 0 - 9\n"
  puts "X = "
  x = gets.chomp.to_i
  puts "Y = "
  y = gets.chomp.to_i
  return x,y
end

@game.start_game

while (!@game.winner && !@game.draw)
  x, y = ask_position_to_player
  @game.send_coordinate(x,y)
end

if @game.winner
  puts "fulatino IS A WINNER\n"
else
  puts "IS A DRAW :("
end

#Jugador #{player1.name} Ingresa la coordenada (x,y):
#>> x: 0
#>> y: 0

#|0,0|0,1|0,2|
#|1,0|1,1|1,2|
#|2,0|2,1|2,2|
