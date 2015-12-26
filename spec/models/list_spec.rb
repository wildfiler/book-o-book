require 'rails_helper'

describe List do
  describe '#recent_five_books' do
    it 'returns recent five books' do
      old_book = create :book, published_at: 2.day.ago, title: 'Old book'
      recent_books = create_list :book, 5, published_at: 1.day.ago, title: 'Recent book'
      oldest_book = create :book, published_at: 3.day.ago, title: 'Oldest book'
      list = create :list, books: recent_books + [oldest_book, old_book]

      books_titles = list.recent_five_books.map(&:title)

      expect(books_titles).to_not include 'Old book'
      expect(books_titles).to_not include 'Oldest book'
    end
  end
end
