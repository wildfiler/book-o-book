require 'rails_helper'

describe 'User views genre page' do
  it 'should see books related to this genre' do
    books = create_list :book, 2
    genre = create :genre, books: books
    visit genre_path(genre)

    expect(page).to have_content(:name)
    books.each do |book|
      expect(page).to have_link(book.title, book_path(book))
    end
  end
end
