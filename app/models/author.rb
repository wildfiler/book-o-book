class Author < ActiveRecord::Base
  has_many :books

  validates :first_name, :last_name, :biography, presence: true

  def last_5_books
    books.recent_five
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
