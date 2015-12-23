class Author < ActiveRecord::Base
  has_many :books

  def last_5_books
    books.recent_five
  end
end
