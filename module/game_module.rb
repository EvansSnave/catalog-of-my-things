require_relative './data_storage'
require_relative '../class/game'
require_relative './author_module'

module GameModule
  include DataStorage
  include GamesAuthor

  def add_game
    load_storage('games')
    puts 'Is this game multi player ? (Y/N)'
    multiplayer = gets.chomp
    puts 'Enter last played date for this game(dd-mm-yyyy):'
    last_played_date = gets.chomp
    puts ['Select 1 to create game with an existing author or', 'Select 2 to create with a new author']
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
    Game.new(multiplayer, last_played_date)
    game_data = { last_played_date: last_played_date, multiplayer: multiplayer.downcase == 'y',
                  authors: author_arr }
    update_storage('games', game_data)
    puts "\n Game with last play date: #{last_played_date} and multiplayer:\
 #{multiplayer.downcase == 'y' ? 'enabled' : 'disabled'} added successfully"
  end

  def list_game
    game = load_storage('games')
    puts 'No game have been added yet' if game.empty?
    game.each_with_index do |x, i|
      puts "\n #{i + i}. Game with Last Play Date:\
 #{x['last_played_date']} and multiplayer: #{x['multiplayer'] == 'enabled' ? 'true' : 'False'} \n \n"
    end
  end
end
