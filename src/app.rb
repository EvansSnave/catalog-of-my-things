require_relative 'data_management/add_data'
require_relative 'require_logic'
require_relative 'list_module'

class App
  include AddData

  def initialize
    @labels = read_all_labels
    @books = read_all_books(@labels)
    @check = Check.new
    @interaction = Interactions.new
    @genres = read_all_genres
    @albums = read_all_albums(@genres)
  end

  include List

  def add_a_book
    id = rand(1..1000)
    publish_date = @interaction.add_publish_date
    publisher = @interaction.add_publisher
    cover_state = @interaction.add_cover_state
    label = nil
    if @labels.empty?
      label = add_label
    else
      list_all_labels
      label_option = @interaction.select_label
      if %w[n N].include?(label_option)
        label = add_label
      else
        index = label_option.to_i
        label = @labels[index]
      end
    end
    book = Book.new(id, publish_date, publisher, cover_state)
    book.add_label(label)
    @books << book
    puts 'Book added successfully'
  end

  def add_label
    id = rand(1..1000)
    title = @interaction.add_title
    color = @interaction.add_color
    label = Label.new(id, title, color)
    @labels << label
    label
  end

  def add_album
    id = Random.rand(1..10_000)
    publish_date = @interaction.publish_date('Enter publish date')
    on_spotify = @interaction.on_spotify?
    genre = select_genre
    album = MusicAlbum.new(id, publish_date, on_spotify: on_spotify)
    album.add_genre(genre)
    @albums.push(album)
    puts "\nAlbum created successfully\n"
  end

  def add_genre
    id = Random.rand(1..20)
    name = @interaction.add_genre
    genre = Genre.new(id, name)
    @genres.push(genre)
    genre
  end

  def select_genre
    genre = nil
    option = nil
    if @genres == []
      genre = add_genre
    else
      puts 'Select a Genre by selecting (index), or press (n) if you need to add a new one'
      list_genres
      option = @u_interact.select_genre
    end
    if %w[n N].include?(option)
      genre = add_genre
    else
      option = option.to_i
      genre = @genres[option]
    end
    genre
  end

  def quit
    save_books(@books) unless @books.empty?
    save_labels(@labels) unless @labels.empty?
    save_album(@albums) unless @albums.empty?
    save_genres(@genres) unless @genres.empty?
    puts 'Thank you for using this app'
    exit
  end
end
