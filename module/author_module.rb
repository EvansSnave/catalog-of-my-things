require_relative './data_storage'
require_relative '../class/author'

module GamesAuthor
  include DataStorage

  def add_author
    load_authors = load_storage('authors')
    puts 'Enter author\'s first name'
    fname = gets.chomp
    puts 'Enter authore\'s last name'
    lname = gets.chomp
    new_author = { first_name: fname, last_name: lname, id: load_authors.length + 1 }
    Author.new(fname, lname)
    update_storage('authors', new_author)
    new_author
  end

  def list_authors
    authors = load_storage('authors')
    puts 'There are no authors yet' if authors.empty?
    authors.each_with_index do |author, index|
      puts "#{index + 1}. First name: #{author['first_name']}, Last Name: #{author['last_name']}\
 with user ID: #{author['id']}"
    end
  end
end
