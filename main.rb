require_relative './app'

def display_options
  options = { 1 => 'List of games', 2 => 'List all authors',
              3 => 'Add a game', 4 => 'Exit' }
  options.each { |key, value| puts "#{key} - #{value}\n" }
  choice = gets.chomp.to_i
  if choice >= 1 && choice <= 4
    choose_option(choice)
  else
    puts 'Select a valid option'
  end
end

def choose_option(choice)
  list_of_games if choice == 1
  choose_option_one(choice)
end

def choose_option_one(choice)
  list_all_authors if choice == 2
  choose_option_two(choice)
end

def choose_option_two(choice)
  add_a_game if choice == 3
  exit if choice == 4
end

def main
  app = App.new
  app.run
end

main
