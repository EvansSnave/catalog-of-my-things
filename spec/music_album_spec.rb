require_relative '../src/logic/music_album'
require_relative '../src/logic/item'

RSpec.describe MusicAlbum do
  let(:label) { double('Label', add_item: nil) }
  let(:music_album) { MusicAlbum.new(1, Date.today, true) }

  describe '#initialize' do
    it 'initializes with given id, publish_date, and on_spotify' do
      expect(music_album.id).to eq(1)
      expect(music_album.publish_date).to eq(Date.today)
      expect(music_album.on_spotify).to be_truthy
    end
  end

  describe '#can_be_archived?' do
    context 'when album is on spotify and older than 10 years' do
      it 'returns true' do
        music_album.publish_date = Date.new(2000, 1, 1)
        expect(music_album.can_be_archived?).to be_truthy
      end
    end

    context 'when album is not on spotify' do
      it 'returns false' do
        music_album.on_spotify = false
        expect(music_album.can_be_archived?).to be_falsy
      end
    end
  end

  describe '#add_label' do
    before do
      music_album.add_label(label)
    end

    it 'adds label to the album' do
      expect(music_album.label).to eq(label)
    end
  end
end
