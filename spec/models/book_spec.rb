require 'rails_helper'

describe Book do
  describe '#authors_full_name' do
    it 'returns authors full name' do
      author = build_stubbed(:author, first_name: 'John', last_name: 'Doe')
      book = build(:book, author: author)

      fullname = book.authors_full_name

      expect(fullname).to eq('John Doe')
    end
  end
end
