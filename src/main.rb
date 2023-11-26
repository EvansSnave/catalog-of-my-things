require_relative 'app'

class Main
  def initialize
    @app = App.new
    @options = {
      '1' => 'list_all_books', '2' => 'list_all_music_albums',
      '3' => 'list_of_games', '4' => 'list_all_genres',
      '5' => 'list_all_labels', '6' => 'list_all_authors',
      '7' => 'add_a_book', '8' => 'add_a_music_album',
      '9' => 'add_a_game', '10' => 'quit'
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
