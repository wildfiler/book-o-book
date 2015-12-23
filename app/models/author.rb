class Author < ActiveRecord::Base
  has_many :books

  def last_5_books (author)
    author.books.order(published_at: :desc).first 5
  end
end
