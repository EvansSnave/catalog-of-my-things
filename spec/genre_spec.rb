require_relative '../src/logic/genre'

RSpec.describe Genre do
  let(:genre) { Genre.new(1, 'Rock') }
  let(:item) { double('Item') }

  describe '#initialize' do
    it 'initializes with given id and name' do
      expect(genre.id).to eq(1)
      expect(genre.name).to eq('Rock')
    end

    it 'initializes with empty items array' do
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    before do
      allow(item).to receive(:genre=)
      genre.add_item(item)
    end

    it 'adds item to the items array' do
      expect(genre.items).to include(item)
    end
  end
end
