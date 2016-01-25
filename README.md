
# TicTacToe

Tic Tac Toe gem will help you with your logic game. Is really simple to use it. This gem isn't yet in "rubygems.org" this is still a test but it could help you. If so, you can clone the repo.

There are four classes in use and all of them are in the same module ' TicTacToe '
Classes: 

1. Game

The Class Game has some methods as board, player, judge, last_player,etc. When the class is instantiated by default a instance variable "current_player" of class player is set to 0. The method player and judge were created. With these methods you can know more about the grid or who is playing.

There are four simple methods to play, the first one is

send_coordinate(x,y) : This method allow us to send two parameters in x and y and will return true if the chip was set in the position given and returns false if the coordinate given cannot set in the current grid.

there_is_a_winner? : Returns true if there is a winner and else returns false.
 
there_is_a_draw? : Returns true if there is a draw game and else returns false.

restart game : If you want to restart the game, the grid and players will be initialized.

2. Player

The turns of player is set as boolean value. 0 =  first player and 1 = second player.

The class Player has only board and current player as instance methods. When you create a Player by default a grid is created with 3x3 dimensions.

set_chip_to_bord(x,y) : Allow us to send to class board the the respective coordinates. Return true if a chip was set and false if not.

change_turn_player : As the name tell us, this method change the turn player.

select_chip : This method is a helper to pass it through Judge to know the past player.

3. Board

The Class Board define and create the current grid to play. In this case the grid is set with three by three dimensions.
The implementation to increase the dimensions is pending.

This method is manage by Player.

4. Judge

Class Judge takes care if there is a winner or a draw game. 


After this brief explanation, I'll show you how to handle the gem.







