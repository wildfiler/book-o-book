class List < ActiveRecord::Base
  has_many :list_entries
  has_many :books, through: :list_entries
  has_many :recent_five_books, -> { recent_five }, through: :list_entries, source: :book

  validates :title, presence: true
end
