class Book < ActiveRecord::Base
  belongs_to :author

  paginates_per 20
end
