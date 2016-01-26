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
      expect(game.player.current_player).to eq(current_player)
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
    before(:each) do
      @judge = double(TicTacToe::Judge.new(3))
      @judge.stub(:winner).and_return(true)
    end

    it "return true if there is a winner" do
      # TicTacToe::Judge.any_instance.stub(:winner).and_return(true)
      # judge.stub(:winner)	{ true }
      expect(game.there_is_a_winner?).to eq(true)
    end

    it "return false if there isn't a winner" do
      expect(game.there_is_a_winner?).to eq(false)
    end
  end

  describe "#there_is_a_draw?" do
    it "return true if there is a draw" do
      TicTacToe::Judge.any_instance.stub(:draw).and_return(true)
      expect(game.there_is_a_draw?).to eq(true)
    end

    it "return false if there isn't a draw" do
      expect(game.there_is_a_draw?).to eq(false)
    end
  end

  describe "#restart_game" do
    # it "reset grid" do
    #   expect(game.restart_game).to eq()
    # end
    #
    # it "change the turn player to second last if is a draw" do
    #   TicTacToe::Judge.any_instance.stub(:draw).and_return(true)
    #   TicTacToe::Player.any_instance.stub(:current_player).and_return(0)
    #   expect(game.restart_game).to
    # end
  end
end

describe TicTacToe::Player do
  let(:player) { TicTacToe::Player.new(3) }
  let(:grid) { Array.new(3) { Array.new(3)} }

  describe "#initialize" do
    it "creates by default a grid with 3 dimension" do
      expect(player.board.grid).to eq(grid)
    end
  end

  describe "#set_chip_to_board" do
    it "returns true if the chip was set" do
      expect(player.set_chip_to_board(0,0)).to eq(true)
    end

    xit "returns false if the chip cannot set in the grid" do
      #TicTacToe::Board.any_instance.stub(:grid).and_return()
      expect(player.set_chip_to_board(0,0)).to eq(false)
    end
  end

  describe "#change_turn_player" do
    it "returns different current_player assigned in current_player variable" do
      #expect(player.change_turn_player).to eq()
    end
  end

  describe "#select_chip" do
    it "returns the opposite current_player" do
    end
  end
end

describe TicTacToe::Board do
  describe "#initialize" do
    it "creates a board method with and array 3 x 3" do
      #expect().to eq()
    end
  end

  describe "#set_chip" do
    it "returns true if a chip was set correctly" do
      #expect().to eq()
    end

    it "returns false if a chip cannot set correctly" do
      #expect().to eq()
    end
  end

  describe "slot_available" do
    it "returns true if a the slot is available" do
      #
    end

    it "returns false if a slot isn't available" do
      #
    end
  end
end

describe TicTacToe::Judge do
  describe "#initialize" do
    it "something" do

    end
  end

  describe "#check_draw" do
    it "is a draw returns true" do
      #expect().to eq()
    end
  end

  describe "#decrement_remaining_moves" do
    it "decremenet by one" do
      #expect().to eq()
    end
  end

  describe "check_winner" do
    it "returns true if there is a winner" do
      #	expect
    end
  end

end
