require_relative 'data/books_data'
require_relative 'data/labels_data'
require_relative 'data/albums_data'
require_relative 'data/genres_data'

module AddData
  include BooksData
  include LabelsData
  include AlbumData
  include GenreData
end
