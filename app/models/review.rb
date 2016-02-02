class Review < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :book_id
  belongs_to :book
  belongs_to :user
end
