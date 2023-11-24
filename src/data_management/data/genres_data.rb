require_relative '../file_helper'

module GenreData
  include FileManager

  def read_all_genres
    data = read_file(create_path('genres.json'))
    data.map { |genre| json_to_genre(genre) }
  end

  def save_genres(genres)
    data = genres.map { |genre| genre_to_json(genre) }
    write_file(create_path('genres.json'), data)
  end

  def genre_to_json(genre)
    {
      id: genre.id,
      name: genre.name,
      items: genre.items.map(&:id)
    }
  end

  def json_to_genre(genre_json)
    Genre.new(genre_json['id'], genre_json['name'])
  end
end
