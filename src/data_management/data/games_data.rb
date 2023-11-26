require_relative '../path_finder'

module GameData
  include PathFinder

  def game_to_json(games)
    {
      id: games.id,
      publish_date: games.publish_date,
      multiplayer: games.multiplayer,
      last_played_at: games.last_played_at,
      author: { id: games.author.id, first_name: games.author.first_name, last_name: games.author.last_name }
    }
  end

  def json_to_game(data_json, author)
    game = Game.new(data_json['id'], data_json['publish_date'], data_json['multiplayer'], data_json['last_played_at'])
    game.add_author(author)
    game
  end

  def read_games(authors)
    data = read_file(create_path('games.json'))
    data.map { |items| json_to_game(items, authors.find { |item2| items['author']['id'] == item2.id }) }
  end

  def save_games(games)
    data = games.map { |items| game_to_json(items) }
    write_file(create_path('games.json'), data)
  end
end
