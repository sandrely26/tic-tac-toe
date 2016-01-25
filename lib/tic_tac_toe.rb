require "tic_tac_toe/version"

module TicTacToe

  class Game
    attr_reader :board, :player, :judge, :score, :last_player

    def initialize(size)
      @player = TicTacToe::Player.new(size)
      @player.current_player = 0
      @judge = TicTacToe::Judge.new(size)
    end

    def send_coordinate(x,y)
      #if there is a position to set a chip
      if player.set_chip_to_board(x,y)
        #isnt a winner
        judge.decrement_remaining_moves
        judge.check_draw
        judge.check_winner(player.board.grid, player.select_chip)
        player.change_turn_player
        return true
      else
        return false
      end
    end

    def there_is_a_winner?
      judge.check_winner(player.board.grid, player.select_chip)
    end

    def there_is_a_draw?
      judge.check_draw
    end

    def restart_game
      last_player = player.current_player
      @player = TicTacToe::Player.new
      if judge.draw
        player.current_player = last_player == 0 ? 1 : 0
      else
        player.current_player = last_player
      end
      @judge = TicTacToe::Judge.new
    end
  end

  class Player
    attr_accessor :board, :current_player

    def initialize(size)
      @board = TicTacToe::Board.new(size)
    end

    def set_chip_to_board(x,y)
      if board.set_chip(x,y,current_player)
         return true
      else
         return false
      end
    end

    def change_turn_player
      @current_player = @current_player == 0 ? 1 : 0
    end

    def select_chip
      current_player == 0 ? 1 : 0
    end
  end

  class Board
    attr_reader :grid

    def initialize(size)
      @grid = Array.new(size) { Array.new(size) }
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

  class Judge
    attr_reader :limit_moves_to_win, :limit_chips_to_win
    attr_accessor :remaining_moves, :winner, :draw
    #decrementar las jugadas

    def initialize(size)
      @limit_chips_to_win = size
      @limit_moves_to_win = @limit_chips_to_win*@limit_chips_to_win
      @remaining_moves = @limit_moves_to_win
      @winner = false
      @draw = false
    end

    def check_draw
      draw = (remaining_moves == 0) && !winner
    end

    def decrement_remaining_moves
      @remaining_moves -= 1
    end

    def check_winner(grid,chip)
      check_grid_horizontal(grid,chip) ||
      check_grid_vertical(grid, chip) ||
      check_grid_diagonal_left_up(grid, chip) ||
      check_grid_diagonal_left_down(grid, chip)
    end

    def check_grid_horizontal(grid,chip)
      for i in 0..(limit_chips_to_win - 1)
        num_chips = 0
        for j in 0..(limit_chips_to_win - 1)
          if grid[i][j] == chip
            num_chips += 1
            @winner = num_chips == limit_chips_to_win
          end
        end
      end
      @winner
    end

    def check_grid_vertical(grid,chip)
      for i in 0..(limit_chips_to_win - 1)
        num_chips = 0
        for j in 0..(limit_chips_to_win - 1)
          if grid[j][i] == chip
            num_chips += 1
            @winner = num_chips == limit_chips_to_win
          end
        end
      end
      @winner
    end

    def check_grid_diagonal_left_up(grid,chip)
      num_chips = 0
      for i in 0..(limit_chips_to_win - 1)
        if grid[i][i] == chip
          num_chips += 1
            @winner = num_chips == limit_chips_to_win
        end
      end
      @winner
    end

    def check_grid_diagonal_left_down(grid,chip)
      column = 0
      num_chips = 0
      (limit_chips_to_win - 1).downto(0) do |i|
        if grid[i][column] == chip
          num_chips += 1
          column += 1
          @winner = num_chips == limit_chips_to_win
        end
      end
      @winner
    end

  end

  class Score
  end

end
