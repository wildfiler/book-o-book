require 'rails_helper'

describe Genre do
  it { should have_many(:books).through(:book_genres) }
  it { should validate_presence_of(:name) }
end
