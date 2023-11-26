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

  def add_title
    puts 'Add a title'
    gets.chomp
  end

  def add_color
    puts 'Add a color'
    gets.chomp
  end

  def select_label
    puts 'Select a label'
    gets.chomp
  end

  def on_spotify?
    puts "\nIs your album on Spotify (Y/N)?"
    input = gets.chomp
    to_cap_letter = input.capitalize
    to_cap_letter == 'Y'
  end

  def add_genre
    puts "\nPlease write the Music Genre you want to add"
    input = gets.chomp
    input.capitalize
    input
  end

  def select_genre
    gets.chomp
  end

  def multiplayer
    loop do
      puts "\nThe game it is multiplayer (Y)es (N)o"
      choose = gets.chomp
      if %w[Y y].include?(choose)
        return true
      elsif %w[N n].include?(choose)
        return false
      else
        puts 'Invalid option, try again'
      end
    end
  end

  def name
    puts "\nEnter author name"
    gets.chomp
  end

  def lname
    puts "\nEnter author last name"
    gets.chomp
  end

  def select_author
    puts 'Select author by the index [not id] or press (n) if you need to add a new one'
    gets.chomp
  end
end
