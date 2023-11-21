class Check
  def check_books(books)
    puts 'Book list:'
    if books.empty?
      puts 'There are not books'
      return nil
    end

    books.each_with_index do |book, index|
      puts "Book #{index}"
      puts "ID: #{book.id}", "Label: #{book.label.name}"
      puts "Publish date: #{book.publish_date}"
      puts "Publisher: #{book.publisher}"
      puts "Cover state: #{book.cover_state}"
    end
  end
end
