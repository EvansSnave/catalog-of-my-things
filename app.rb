require './module/game_module'
require_relative './module/author_module'

class App
  include GameModule
  include DataStorage


  def initialize
    @games = []
    @authors = []
  end

  def run
    display_options
  end

  def list_of_games
    list_game
  end

  def list_all_authors
    list_authors
  end

  def add_a_game
    add_game
  end
end
