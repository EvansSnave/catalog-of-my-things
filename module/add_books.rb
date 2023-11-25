require './class/book'
require './class/label'
require_relative './data_storage'
module BookModule
  include DataStorage

  def add_books
    load_storage('books')
    publish_date = ask_publish_date
    ask_archived
    cover_state = ask_cover_state
    publisher = ask_publisher
    book = Book.new(publisher, cover_state, publish_date)
    @books.push(book)
    book_data = { publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
                  archived: book.archived, id: Random.rand(1..100) }
    update_storage('books', book_data)
    load_storage('labels')
    title = ask_title
    color = ask_color
    label = Label.new(title, color)
    label_data = { title: label.title, color: label.color, id: Random.rand(1..100) }
    @labels.push(label)
    update_storage('labels', label_data)
    puts 'BOOK AND LABEL CREATED SUCCESSFULLY'
    puts "\n"
  end

  def list_books
    books = load_storage('books')
    puts 'No Books: ' if books.length.zero?
    books.each_with_index do |book, index|
      puts "#{index + 1}. Publish_date: #{book['publish_date']}, cover_state: #{book['cover_state']}",
           "Publisher: #{book['publisher']}, Archived: #{book['archived']}, ID: #{book['id']}"
    end
    puts "\n"
  end

  def list_label
    labels = load_storage('labels')
    puts 'No label: ' if labels.length.zero?
    labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label['title']}, Color: #{label['color']}, ID: #{label['id']}"
    end
    puts "\n"
  end

  def ask_cover_state
    print 'Type cover state: '
    gets.chomp
  end

  def ask_publisher
    print 'Publisher: '
    gets.chomp
  end

  def ask_publish_date
    puts 'Type publish date'
    print 'Publish date [dd-mm-yyyy]: '
    gets.chomp
  end

  def ask_archived
    puts 'Select if is already archived'
    print 'Is archived? [Yy/Nn]: '
    gets.chomp
  end

  def ask_title
    print 'Type title: '
    gets.chomp
  end

  def ask_color
    print 'Type color: '
    gets.chomp
  end
end
