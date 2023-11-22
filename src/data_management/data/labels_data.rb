require_relative '../path_finder'

module LabelsData
  include PathFinder
  def read_all_labels
    data = read_file(create_path('labels.json'))
    data.map { |label| json_to_label(label) }
  end

  def save_all_labels(labels)
    data = labels.map { |label| label_to_json(label) }
    write(create_path('labels.json'), data)
  end

  def label_to_json(label)
    {
      id: label.id,
      title: label.title,
      color: label.color
    }
  end

  def json_to_label(json)
    Label.new(json['id'], json['title'], json['color'])
  end
end
