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
end
