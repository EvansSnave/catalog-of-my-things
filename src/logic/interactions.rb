require 'date'

class Interactions
  def add_publish_date
    puts 'Type the publish date'
    puts 'Year:'
    year = gets.chomp.to_i
    puts 'Month number. Example: 05 = may'
    month = gets.chomp.to_i
    puts 'Day:'
    day = gets.chomp.to_i
    Date.parse("#{year}-#{month}-#{day}")
  end

  def add_publisher
    puts 'Type the publisher'
    gets.chomp
  end

  def add_cover_state
    puts 'Select a cover state'
    puts '1- good', '2- bad'
    option = gets.chomp.to_i
    cover = nil
    case option
    when 1 then cover = 'good'
    when 2 then cover = 'bad'
    else
      puts 'Invalid option'
      add_cover_state
    end
    cover
  end
end
