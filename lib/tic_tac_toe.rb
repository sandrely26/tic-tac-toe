require "tic_tac_toe/version"

module TicTacToe
  class Game
    #cambiar los accesors a reader o writers
    attr_accessor :current_player,
    :winner,
    :draw,
    :grid,
    :limit_chips_to_win,
    :limit_moves,
    :remaining_moves
    :keep_playing

    def initialize
      @current_player = 0
      @winner = false
      @draw = false
      @keep_playing = false
      @limit_chips_to_win = 3
      @limit_moves = @limit_chips_to_win*@limit_chips_to_win
      @remaining_moves = @limit_moves
    end

    def start_game
      start_board
    end

    def start_board
      @grid = Array.new(3) { Array.new(3) }
    end

    def send_coordinate(x,y)
      if slot_available?(x,y)
        set_chip(x,y)
        decrement_moves
        check_draw
        check_winner
        change_turn
        return true
      else
        return false
      end
    end

    def slot_available?(x,y)
      @grid[x][y].nil?
    end

    def set_chip(x,y)
      @grid[x][y] = current_player
    end

    def decrement_moves
      @remaining_moves -= 1
    end

    def check_draw
      if (@remaining_moves == 0) && !@winner
        @draw = true
    end

    def check_winner
      check_grid_horizontal || check_grid_vertical ||
      check_grid_diagonal_left_up || check_grid_diagonal_left_down
    end

    def check_grid_horizontal
      for i in 0..(@limit_chips_to_win - 1)
        num_chips = 0
        for j in 0..(@limit_chips_to_win - 1)
          if @grid[i][j] == @current_player
            num_chips += 1
            @winner = num_chips == @limit_chips_to_win
          end
        end
      end
      @winner
    end

    def check_grid_vertical
      for i in 0..(@limit_chips_to_win - 1)
        num_chips = 0
        for j in 0..(@limit_chips_to_win - 1)
          if @grid[j][i] == @current_player
            num_chips += 1
            @winner = num_chips == @limit_chips_to_win
          end
        end
      end
      @winner
    end

    def check_grid_diagonal_left_up
      num_chips = 0
      for i in 0..(@limit_chips_to_win - 1)
        if @grid[i][i] == @current_player
          num_chips += 1
            @winner = num_chips == @limit_chips_to_win
        end
      end
      @winner
    end

    def check_grid_diagonal_left_down
      column = 0
      num_chips = 0
      (@limit_chips_to_win - 1).downto(0) do |i|
        if @grid[i][column] == @current_player
          num_chips += 1
          column += 1
          @winner = num_chips == @limit_chips_to_win
        end
      end
      @winner
    end

    def change_turn
      @current_player = @current_player == 0 ? 1 : 0
    end

  end
end
