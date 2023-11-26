# Item class
class Item
  attr_reader :publish_date, :id, :archived

  def initialize(publish_date: Time.now)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current = Time.now.year - publish_date.year.to_i
    true if current > 10
  end
end
