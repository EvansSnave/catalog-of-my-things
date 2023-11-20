require 'json'

module PathFinder
  def create_path(file)
    "./src/data_management/files/#{file}"
  end

  def read_file(file)
    return [] unless File.exist?(file)
    JSON.parse(File.read(file))
  end

  def write_file(file, data)
    File.write(file, JSON.pretty_generate(data))
  end
end
