require_relative 'app'

class Main
  def initialize
    @app = App.new
    @options = {
      '1' => 'list_all_books', '2' => 'list_all_music_albums',
      '3' => 'list_all_movies', '4' => 'list_of_games',
      '5' => 'list_all_genres', '6' => 'list_all_labels',
      '7' => 'list_all_authors', '8' => 'list_all_sources',
      '9' => 'add_a_book', '10' => 'add_a_music_album',
      '11' => 'add_a_movie', '12' => 'add_a_game',
      '13' => 'quit'
    }.freeze
  end

  def menu
    puts "\nSelect an option"
    @options.each do |key, value|
      puts "#{key}- #{value.capitalize.gsub('_', ' ')}"
    end
    action = @options[gets.chomp]
    if action
      action
    else
      puts "\nInvalid option"
      menu
    end
  end

  def start
    puts 'Welcome to catalog of my things'
    loop do
      @app.send(menu)
    end
  end
end

Main.new.start
