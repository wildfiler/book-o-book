class Book < ActiveRecord::Base
  belongs_to :author
  has_many :list_entries
  has_many :lists, through: :list_entries

  has_many :book_genres
  has_many :genres, through: :book_genres

  validates :title, :description, :published_at, :cover_url, presence: true

  scope :recent_five, -> { order(published_at: :desc).limit(5) }

  paginates_per 20

  def authors_full_name
    author.full_name
  end
end
