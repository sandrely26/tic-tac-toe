
# TicTacToe

Tic Tac Toe gem will help you with your logic game. It's really simple to use it.

##Installation

Copy this line into your GameFile.

```
gem 'tic_tac_toe', github: 'sandrely26/tic-tac-toe'
```
and then execute 
```
$ bundle install
```
##How it works

There are four classes in use and all of them are in the same module ' TicTacToe '

###**Game**###

The Class Game has some methods as board, player, judge, last_player,etc. When the class is instantiated by default a instance variable "current_player" of class player is set to 0. The method player and judge were created. With these methods you can know more about the grid or who is playing.

There are four simple methods to play, the first one is

**send_coordinate(x,y)** : This method allow us to send two parameters in x and y and will return true if the chip was set in the position given and returns false if the coordinate given cannot set in the current grid.

**there_is_a_winner?** : Returns true if there is a winner and else returns false.
 
**there_is_a_draw?** : Returns true if there is a draw game and else returns false.

**restart game** : If you want to restart the game, the grid and players will be initialized.

###**Player**###

The turns of player is set as boolean value. 0 =  first player and 1 = second player.

The class Player has only board and current player as instance methods. When you create a Player by default a grid is created with 3x3 dimensions.

**set_chip_to_bord(x,y)** : Allow us to send to class board the the respective coordinates. Return true if a chip was set and false if not.

**change_turn_player** : As the name tell us, this method change the turn player.

**select_chip** : This method is a helper to pass it through Judge to know the past player.

###**Board**###

The Class Board define and create the current grid to play. In this case the grid is set with three by three dimensions.
The implementation to increase the dimensions is pending. This method is manage by Player.

###**Judge**###

Class Judge takes care if there is a winner or a draw game. 

##Usage

After this brief explanation, I'll show you how to handle the gem.

The first step is require the gem:

```
require 'tic_tac_toe' 
```

After that you need to instantiate the Class Game passing a parameters as the board's size. This class is the one that is going to interact all the time with the logic.

```
game = TicTacToc::Game.new(3)
```

After doing that, to start playing and setting the chips on grid and send the player coordinates, do this: 

```
game.send_coordinate(x,y)
=> true #if the the coordinate was set correctly 
=> false #if not
```

To check if there is a winner, do: 

``` 
game.there_is_a_winner?
=> true #if there is a winner
=> false #there isn't a winner
```

To check if there is a draw, do: 

``` 
game.there_is_a_draw?
=> true #if there is a draw
=> false #if not
```

And if you want to restart the game, is simple too.

```
game.restart_game
```

And repeat the same instructions above to keep playing.

If was a draw the second-last will start.
If there was a winner the loser will start.

###Upcoming

- [ ] Use more than only three dimensions.
