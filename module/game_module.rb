require_relative 'data_storage'
require_relative '../class/game'
require_relative 'author_module'

module GameModule
  include DataStorage
  include GamesAuthor

  def add_game
    load_storage('games')
    multiplayer = ask_multiplayer_status
    last_played_date = ask_last_played_date

    author_arr = choose_author

    create_game(multiplayer, last_played_date, author_arr)

    display_success_message(last_played_date, multiplayer)
  end

  def list_game
    game = load_storage('games')
    puts 'No games have been added yet' if game.empty?
    game.each_with_index do |x, i|
      display_game_info(x, i)
    end
  end

  # ... Other methods

  private

  def ask_multiplayer_status
    puts 'Is this game multiplayer? (Y/N)'
    gets.chomp
  end

  def ask_last_played_date
    puts 'Enter last played date for this game (dd-mm-yyyy):'
    gets.chomp
  end

  def choose_author
    puts [
      'Select 1 to create game with an existing author or',
      'Select 2 to create with a new author'
    ]
    author_choice = gets.chomp.to_i
    author_arr = []

    if author_choice == 1
      list_authors
      puts 'Select author by id'
      id = gets.chomp.to_i
      load_storage('authors').select { |author| author_arr << author if author['id'] == id }
    else
      author_arr << add_author
    end
    author_arr
  end

  def create_game(multiplayer, last_played_date, author_arr)
    Game.new(multiplayer, last_played_date)
    game_data = {
      last_played_date: last_played_date,
      multiplayer: multiplayer.downcase == 'y',
      authors: author_arr
    }
    update_storage('games', game_data)
  end

  def display_success_message(last_played_date, multiplayer)
    puts "\nGame with last play date: #{last_played_date} and multiplayer: #{multiplayer.downcase == 'y' ? 'enabled' : 'disabled'} added successfully"
  end

  def display_game_info(x, i)
    puts "\n#{i + 1}. Game with Last Play Date: #{x['last_played_date']} and multiplayer: #{x['multiplayer'] == 'enabled' ? 'true' : 'False'}\n\n"
  end
end
