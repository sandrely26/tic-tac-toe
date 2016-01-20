# la gema solo necesita saber cuando comenzar a jugar
#
# cuando instancies la gema,
# esta tendra metodos como
#   -comenzar a jugar
#   -los turnos seran alternados
#
# pero como sabe la gema quien esta jugando, si no tiene nombre ni alguna key
# la gema no necesita saber nombres o fichas.
# desde un principio cuando la gema este inicializada se va a crear un current_turn
# cuando
# current_turn  = 0 = first_player
# current_turno = 1 = second_player

module TicTacToe
  class Game
    def start_game
      def initialize
        @current_player = 0
        @player_sum[0] = 0
        @player_sum[1] = 0
        @winner = false
        @draw = false
        @position_elements = []
      end
    end

    def set_position(num)
      if slot_available(num)
        @player_sum[current_player] += num
        if is_winner
        return true
      else
        return false
      end
    end

    def slot_available(num)
      #validar si la posicion se puede escribir
      #se van guardando los elemento ingresados en position_elements
      @position_elements.each do |element|
        if element == num
          return false
      end
      position_elements.push(num)
    end

    def is_winner
      if (@player_sum[current_player] == 6 ||
            @player_sum[current_player] == 12 ||
            @player_sum[current_player] == 15 ||
            @player_sum[current_player] == 18 ||
            @player_sum[current_player] == 24)
        @winner = true
        return true
      else
        set_turn
      end
    end

    def set_turn
      if current_player == 0
        current_player = 1
      else
        current_player = 0
      end
    end

  end
end
