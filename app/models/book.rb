class Book < ActiveRecord::Base
  paginates_per 20
end
