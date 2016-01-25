require 'spec_helper'
require 'pry'

describe TicTacToe do
  it 'has a version number' do
    expect(TicTacToe::VERSION).not_to be nil
  end
end

describe TicTacToe::Game do
  let(:game) { TicTacToe::Game.new }
  let(:current_player) { game.player.current_player = 0}
  let(:grid) { Array.new(3) { Array.new(3)} }
  let (:judge) { TicTacToe::Judge.new }

  describe "#initialize" do
    it "creates board" do
      expect(game.player.board.grid).to eq(grid)
    end
    it "creates player instantiate" do
      expect(game.player.current_player).to eq(current_player	)
    end

    xit "creates judge instantiate" do
      expect(game.judge).to eq(TicTacToe::Judge.new )
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
    xit "return true if there is a winner" do
      expect(judge.winner).to eq(true)
      expect(game.there_is_a_winner?).to eq(true)
    end

    it "return false if there isn't a winner" do
      expect(game.there_is_a_winner?).to eq(judge.winner)
    end
  end

  describe "#there_is_a_draw?" do
    xit "return true if there is a draw" do
      expect(judge.draw).to eq(true)
      expect(game.there_is_a_draw?).to eq(true)
    end

    it "return false if there isn't a draw" do
      expect(game.there_is_a_draw?).to eq(judge.draw)
    end
  end

  describe "#restart_game" do
    it "reset grid" do
    end

    it "reset variables" do
    end
  end
end
