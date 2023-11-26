class Check
  def check_books(books)
    puts 'Book list:'
    if books.empty?
      puts 'There are not books'
      return nil
    end

    books.each_with_index do |book, index|
      puts "Book #{index}"
      puts "ID: #{book.id}", "Label: #{book.label.title}"
      puts "Publish date: #{book.publish_date}"
      puts "Publisher: #{book.publisher}"
      puts "Cover state: #{book.cover_state}"
    end
  end

  def check_labels(labels)
    puts 'Label list:'
    if labels.empty?
      puts 'There are not labels'
      return nil
    end
    labels.each_with_index do |label, index|
      puts "Label #{index}", "ID: #{label.id}", "Title: #{label.title}"
      puts "Color: #{label.color}"
    end
  end
end
