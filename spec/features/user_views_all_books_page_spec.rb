require 'rails_helper'

describe 'User visits books page' do
  it 'shows all books' do
    create :book, title: 'Book 1'
    create :book, title: 'Book 2'

    visit '/books'

    expect(page).to have_css('.book', text: 'Book 1')
    expect(page).to have_css('.book', text: 'Book 2')
  end

  it 'has pagination' do
    create_list(:book, Book.paginates_per(2) + 1)

    visit '/books'

    expect(page).to have_css('.book', count: 2)
    expect(page).to have_css('.pagination')
  end

  it 'shows genre of books' do
    book = create :book
    genres = create_list :genre, 2, books: [book]
    visit '/books'

    genres.each do |genre|
      expect(page).to have_css('.genre', text: genre.name)
      expect(page).to have_link(genre.name, genre_path(genre))
    end
  end
end
