require_relative '../class/game'

describe 'Testing the game class implementation' do
  before(:each) do
    @games = Game.new(true, '12-12-2021')
  end

  it 'Returns the class instance of @game' do
    expect(Game.new(true, '12-12-2021')).to be_instance_of Game
  end

  it 'Returns superclass of game' do
    expect(Game.superclass).to eq Item
  end
end
