module List
  def list_all_books
    @check.check_books(@books)
  end

  def list_all_labels
    @check.check_labels(@labels)
  end

  def list_all_music_albums
    @check.check_list_albums(@albums)
  end

  def list_all_genres
    @check.check_list_genres(@genres)
  end
  def list_all_authors
    @check.check_list_authors(@authors)
  end

  def list_of_games
    @check.check_list_games(@games)
  end
end
