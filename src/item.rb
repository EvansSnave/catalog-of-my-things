class Item
  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    current_year = Time.now.year
    current_year - @publish_date > 10
  end

  def move_to_archive
    if self.can_be_archived?
      @archived = true
    end
  end
end
