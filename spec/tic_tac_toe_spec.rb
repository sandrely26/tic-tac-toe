require 'spec_helper'

describe TicTacToe do
  it 'has a version number' do
    expect(TicTacToe::VERSION).not_to be nil
  end

  context 'when a player is instantiated' do
    it 'should has the name value' do
      player = TicTacToe::Player.new("sandy")
      expect(player.name).to eq("sandy")
    end
  end

  context 'when a board is instantiated' do
    it 'initialize 3x3 empty grid' do
      expect(TicTacToe::Board.new.grid).to match_array([["","",""],["","",""],["","",""]])
    end
  end

  context 'when a chip is set' do
    it 'set the chip in the right position' do
    end
  end

end
