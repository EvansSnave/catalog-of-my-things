require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :label, :author

  def initialize(id, publish_date, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def add_label(label)
    @label = label
    label.add_item(self)
  end
end
