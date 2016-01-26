require 'spec_helper'
require 'pry'

describe TicTacToe do
  it 'has a version number' do
    expect(TicTacToe::VERSION).not_to be nil
  end
end

describe TicTacToe::Game do
  let(:game) { TicTacToe::Game.new(3) }
  let(:current_player) { game.player.current_player = 0 }
  let(:grid) { Array.new(3) { Array.new(3)} }
  let(:judge) { TicTacToe::Judge.new(3) }

  describe "#initialize" do
    it "creates board with 3 dimension" do
      expect(game.player.board.grid).to eq(grid)
    end
    it "creates current player with zero value " do
      expect(game.player.current_player).to eq(0)
    end
  end

  describe "#send_coordinate" do
    it "returns true the first time with x=0 and y=0 cordinates" do
      expect(game.send_coordinate(0,0)).to eq(true)
    end

    it "returns false the sencond time with the same coordinate" do
      expect(game.send_coordinate(0,0)).to eq(true)
      expect(game.send_coordinate(0,0)).to eq(false)
    end
  end

  describe "#there_is_a_winner?" do
    it "return true if there is a winner" do
      game.judge.winner = true
      expect(game.there_is_a_winner?).to eq(true)
    end

    it "return false if there isn't a winner" do
      expect(game.there_is_a_winner?).to eq(false)
    end
  end

  describe "#there_is_a_draw?" do
    xit "return true if there is a draw" do
      #TicTacToe::Judge.any_instance.stub(:draw).and_return(true)
      game.judge.draw = true
      expect(game.there_is_a_draw?).to eq(true)
    end

    it "return false if there isn't a draw" do
      expect(game.there_is_a_draw?).to eq(false)
    end
  end

  describe "#restart_game" do
    it "returns new judge instance" do
      game.restart_game(3).should eql?(judge)
    end
  end
end

describe TicTacToe::Player do
  let(:player) { TicTacToe::Player.new(3) }
  let(:grid) { Array.new(3) { Array.new(3)} }
  let(:board) { TicTacToe::Board.new(3) }

  describe "#initialize" do
    it "creates by default a grid with 3 dimension" do
      expect(player.board.grid).to eq(grid)
    end
  end

  describe "#set_chip_to_board" do
    it "returns true if the chip was set" do
      expect(player.set_chip_to_board(0,0)).to eq(true)
    end

    it "returns false if the chip cannot set in the grid" do
      #board.grid[0][0] = 0
      player.board.grid[0][0] = 0
      #TicTacToe::Board.any_instance.stub(:grid).and_return()
      expect(player.set_chip_to_board(0,0)).to eq(false)
    end
  end

  describe "#change_turn_player" do
    it "returns different current_player assigned in current_player variable" do
      player.current_player = 0
      expect(player.change_turn_player).to eq(1)
    end
  end

  describe "#select_chip" do
    it "returns the opposite current_player" do
      player.current_player = 0
      expect(player.change_turn_player).to eq(1)
    end
  end
end

describe TicTacToe::Board do
  let(:array) { Array.new(3) { Array.new(3) } }
  let(:board) { TicTacToe::Board.new(3) }

  describe "#initialize" do
    it "creates a board method with and array 3 x 3" do
      expect(board.grid).to eq(array)
    end
  end

  describe "#set_chip" do
    it "returns true if a chip was set correctly" do
      expect(board.set_chip(0,0,0)).to eq(true)
    end

    it "returns false if a chip cannot set correctly" do
      board.grid[0][0] = 0
      expect(board.set_chip(0,0,0)).to eq(false)
    end
  end

  describe "slot_available" do
    it "returns true if a the slot is available" do
      expect(board.slot_available?(0,0)).to eq(true)
    end

    it "returns false if a slot isn't available" do
      board.grid[0][0] = 0
      expect(board.slot_available?(0,0)).to eq(false)
    end
  end
end

describe TicTacToe::Judge do
  let(:judge) { TicTacToe::Judge.new(3) }
  let(:grid) { Array.new(3) { Array.new(3)} }

  describe "#initialize" do
    it "has initialize variables" do
      expect(judge.winner).to eq(false)
      expect(judge.draw).to eq(false)
      expect(judge.limit_chips_to_win).to eq(3)
      expect(judge.limit_moves_to_win).to eq(9)
      expect(judge.remaining_moves).to eq(9)
    end
  end

  describe "#check_draw" do
    it "returns true when there is a draw" do
      judge.remaining_moves = 0
      expect(judge.check_draw).to eq(true)
    end

    it "returns false when there isn't a draw" do
      expect(judge.check_draw).to eq(false)
    end
  end

  describe "#decrement_remaining_moves" do
    it "decremenet by one" do
      expect{judge.decrement_remaining_moves}.to change{judge.remaining_moves}.from(9).to(8)
    end
  end

  describe "#check_winner" do
    it "returns true if there is a winner" do
      judge.winner = true
      expect(judge.check_winner(grid,0)).to eq(true)
    end

    it "returns false if there isn't a winner" do
      expect(judge.check_winner(grid,0)).to eq(false)
    end
  end

  describe "#check_grid_horizontal" do
    it "returns true if there is a horizontal line" do
      grid[0][0] = 0
      grid[0][1] = 0
      grid[0][2] = 0

      expect(judge.check_grid_horizontal(grid,0)).to eq(true)
    end

    it "returns false if there isnt a horizontal line" do
      expect(judge.check_grid_horizontal(grid,0)).to eq(false)
    end
  end

  describe "#check_grid_vertical" do
    it "returns true if there is a vertical line" do
      grid[0][0] = 0
      grid[1][0] = 0
      grid[2][0] = 0

      expect(judge.check_grid_vertical(grid,0)).to eq(true)
    end

    it "returns false if there isnt a vertical line" do
      expect(judge.check_grid_vertical(grid,0)).to eq(false)
    end
  end

  describe "#check_grid_diagonal_left_up" do
    it "returns true if there is a diagonal line left-up" do
      grid[0][0] = 0
      grid[1][1] = 0
      grid[2][2] = 0

      expect(judge.check_grid_diagonal_left_up(grid,0)).to eq(true)
    end

    it "returns false if there isnt a diagonal line left-up" do
      expect(judge.check_grid_diagonal_left_up(grid,0)).to eq(false)
    end
  end

  describe "#check_grid_diagonal_left_down" do
    it "returns true if there is a diagonal left-down" do
      grid[0][2] = 0
      grid[1][1] = 0
      grid[2][0] = 0

      expect(judge.check_grid_diagonal_left_down(grid,0)).to eq(true)
    end

    it "returns false if there isnt a diagonal left-down" do
      expect(judge.check_grid_diagonal_left_down(grid,0)).to eq(false)
    end
  end
end
