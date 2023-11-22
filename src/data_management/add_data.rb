require_relative 'data/books_data'
require_relative 'data/labels_data'

module AddData
  include BooksData
  include LabelsData
end
