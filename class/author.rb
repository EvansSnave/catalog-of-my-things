require_relative './item'

class Author < Item
  attr_accessor :items, :first_name

  def initialize(first_name, last_name)
    super()
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(game)
    @items << game
    game.author = self
  end
end
