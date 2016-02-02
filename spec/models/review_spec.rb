require 'rails_helper'

describe Review do
  describe "assosiasions" do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end


  describe "User can leave only one review to book" do
    it { should validate_uniqueness_of(:user_id).scoped_to(:book_id) }
  end
end
