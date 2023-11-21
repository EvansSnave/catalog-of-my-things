require_relative './data_management/add_data'
require_relative './require_logic'
require_relative './list_module'

class App
  include AddData

  def initialize
    @labels
    @books = read_all_books(@labels)
    @check = Check.new
    @interaction = Interactions.new
  end

  include List

  def add_a_book
    id = rand(1..1000)
    publish_date = @interaction.add_publish_date
    publisher = @interaction.add_publisher
    cover_state = @interaction.add_cover_state
    book = Book.new(id, publish_date, publisher, cover_state)
    @books << book
    puts 'Book added successfully'
  end

  def quit
    save_books(@books) unless @books.empty?
    puts 'Thank you for using this app'
  end
end
