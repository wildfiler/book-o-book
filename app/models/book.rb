class Book < ActiveRecord::Base
  belongs_to :author

  scope :recent_five, -> {order(published_at: :desc).first 5}

  paginates_per 20
end
