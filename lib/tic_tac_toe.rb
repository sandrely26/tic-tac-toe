require "tic_tac_toe/version"

module TicTacToe
  require "tic_tac_toe/version"

  module TicTacToe
    class Game
      attr_accessor :current_player, :winner, :draw, :grid, :limit_chips, :limit_moves, :moves
      def initialize
        @current_player = 0
        @winner = false
        @draw = false
        @limit_chips = 3
        @limit_moves = @limit_chips*@limit_chips
        @moves = 0
      end

      def start_game
        start_board
      end

      def start_board
        @grid = Array.new(3) { Array.new(3) }
      end

      def set_coordinate(x,y)
        binding.pry
        if set_position(x,y)
          change_turn
        end
      end

      def set_position(x,y)
        binding.pry
        if slot_available(x,y)
          set_chip(x,y)
          return is_winner
        else
          return is_draw
        end
      end

      def slot_available(x,y)
        # si hay un lugar ocupado entra al if
        if @grid[x][y]
          return false
        else
          return true
        end
      end

      def set_chip(x,y)
        @grid[x][y] = current_player
        @moves += 1
      end

      def is_draw
        if @moves == @limit_moves && winner
          return @draw = true
        else
          return false
        end
      end

      def is_winner
        grid_horizontal  || grid_vertical   || grid_diagonal_from_left   || grid_diagonal_from_rigth
      end

      def grid_horizontal
        @grid.each do |row|
          num_chips = 0
          row.each do |element|
            #si el elemento es igual estado 0 o 1 del current_player
            if element == current_player
              #sumar las fichas, hasta que haya 3 para poder ganar
              num_chips += 1
              #limit_chips = 3
              if num_chips == @limit_chips
                return @winner = true
              end
            end
          end
        end
      end

      def grid_vertical
        num_chips = 0
        for i in 0..@limit_chips
          for j in 0..@limit_chips
            if @grid[j][i] == current_player
              num_chips += 1
              if num_chips == @limit_chips
                return @winner = true
              end
            end
          end
        end
      end

      def grid_diagonal_from_left_up
        num_chips = 0
        for i in 0..@limit_chips
          if @grid[i][i] == current_player
            num_chips += 1
            if num_chips == @limit_chips
              return @winner = true
            end
          end
        end
      end

      def grid_diagonal_from_left_down
        column = 0
        num_chips = 0
        @limit_chips.downto(0) do |i|
          if @grid[i][column] == current_player
            num_chips += 1
            if num_chips == @limit_chips
              return @winner = true
            end
          end
        end
      end

      def change_turn
        if @current_player == 0
          @current_player = 1
        else
          @current_player = 0
        end
      end

    end
  end
end
