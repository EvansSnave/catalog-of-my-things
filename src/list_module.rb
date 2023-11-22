module List
  def list_all_books
    @check.check_books(@books)
  end

  def list_all_labels
    @check.check_labels(@labels)
  end
end
