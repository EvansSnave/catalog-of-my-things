require_relative '../path_finder'

module BooksData
  include PathFinder

  file = path_finder('books.json')

  def read_all_books(labels)
    data = read_file(file)
    data.map {|book| json_to_book(book, labels.find {|label| book['label']['id'] == label.id})}
  end

  def save_books(books)
    json = books.map {|book| book_to_json(book)}
    write_file(file, json)
  end

  def book_to_json(book)
    {
      id: book.id,
      publish_date: book.publish_date,
      publisher: book.publisher,
      cover_state: book.cover_state
      label: {
        id: book.label.id,
        title: book.label.title,
        color: book.label.color
      }
    }
  end

  def json_to_book(json, label)
    book = Book.new(json['id'], json['publish_date'], json['publisher'], json['cover_state'])
    book.add_label(label)
    book
  end
end
