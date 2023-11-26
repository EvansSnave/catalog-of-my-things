class Item
  attr_accessor :id, :publish_date, :genre, :author, :label, :source, :archived

  def initialize(id, publish_date)
    @id = id
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_label(label)
    @label = label
    label.add_item(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self)
  end

  def add_source; end

  private

  def can_be_archived?
    current_year = Time.now.year
    current_year - @publish_date > 10
  end
end
