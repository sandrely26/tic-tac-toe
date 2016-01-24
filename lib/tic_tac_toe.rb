require "tic_tac_toe/version"

module TicTacToe
  class Game
    attr_reader :board, :player, :judge, :scoreboard

    def initialize
      @player = TicTacToe::Player.new
      @judge = TicTacToe::Judge.new
    end

    def there_is_a_winner?
      judge.check_winner(player.board.grid, player.current_player)
    end

    def there_is_a_draw?
      judge.check_draw
    end

    def restart_game
      puts "restart game"
    end
  end

  class Player
    attr_accessor :board, :current_player

    def initialize
      @current_player = 0
      @board = TicTacToe::Board.new
    end

    def set_chip_to_board(x,y)
      if board.set_chip(x,y,current_player)
         change_turn
         return true
      else
         return false
      end
    end

    def change_turn
      @current_player = @current_player == 0 ? 1 : 0
    end

  end

  class Board
    attr_reader :grid

    def initialize
      @grid = Array.new(3) { Array.new(3) }
    end

    #private
    def set_chip(x,y, current_player)
      if slot_available?(x,y)
        @grid[x][y] = current_player
        return true
      else
        return false
      end
    end

    def slot_available?(x,y)
      @grid[x][y].nil?
    end
  end

  class Juedge
    attr_reader :limit_moves_to_win, :limit_chips_to_win,
      :remaining_moves, :winner, :draw

    def initialize
      @limit_chips_to_win = 3
      @limit_moves_to_win = @limit_chips_to_win*@limit_chips_to_win
      @remaining_moves = @limit_moves_to_win
      @winner = false
      @draw = false
    end

    def check_draw
      draw = (remaining_moves == 0) && !winner
    end

    def check_winner(grid,current_player)
      check_grid_horizontal(grid,current_player) ||
      check_grid_vertical(grid,current_player) ||
      check_grid_diagonal_left_up(grid,current_player) ||
      check_grid_diagonal_left_down(grid,current_player)
    end

    def check_grid_horizontal(grid,current_player)
      for i in 0..(limit_chips_to_win - 1)
        num_chips = 0
        for j in 0..(limit_chips_to_win - 1)
          if grid[i][j] == current_player
            num_chips += 1
            winner = num_chips == limit_chips_to_win
          end
        end
      end
      winner
    end

    def check_grid_vertical(grid,current_player)
      for i in 0..(limit_chips_to_win - 1)
        num_chips = 0
        for j in 0..(limit_chips_to_win - 1)
          if grid[j][i] == current_player
            num_chips += 1
            winner = num_chips == limit_chips_to_win
          end
        end
      end
      winner
    end

    def check_grid_diagonal_left_up(grid,current_player)
      num_chips = 0
      for i in 0..(limit_chips_to_win - 1)
        if grid[i][i] == current_player
          num_chips += 1
            winner = num_chips == limit_chips_to_win
        end
      end
      winner
    end

    def check_grid_diagonal_left_down(grid,current_player)
      column = 0
      num_chips = 0
      (limit_chips_to_win - 1).downto(0) do |i|
        if grid[i][column] == current_player
          num_chips += 1
          column += 1
          winner = num_chips == limit_chips_to_win
        end
      end
      winner
    end

  end

  class Score
  end

end
