require_relative '../path_finder'

module AuthorsData
  include PathFinder

  def read_all_authors
    data = read_file(create_path('authors.json'))
    data.map { |items| json_to_author(items) }
  end

  def save_authors(authors)
    data = authors.map { |items| author_to_json(items) }
    write_file(create_path('authors.json'), data)
  end

  def author_to_json(authors)
    {
      id: authors.id,
      first_name: authors.first_name,
      last_name: authors.last_name,
      items: authors.items.map(&:id)
    }
  end

  def json_to_author(data_json)
    Author.new(data_json['id'], data_json['first_name'], data_json['last_name'])
  end
end
