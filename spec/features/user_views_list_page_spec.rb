require 'rails_helper'

describe 'User visits list page' do
  it 'see list with books' do
    books = create_list :book, 10
    list = create :list, books: books, title: 'Cool list'

    visit list_path(list)

    expect(page).to have_content('Cool list')
    page_have_books books
  end

  def page_have_books(books)
    expect(page).to have_css('.books')
    expect(page).to have_css('.book', count: books.size)

    books.each do |book|
      page_have_book(book)
    end
  end

  def page_have_book(book)
    expect(page).to have_css('.book .title', text: book.title)
    expect(page).to have_css('.book .description', text: book.description)
    expect(page).to have_css(".book .cover img[src='#{book.cover_url}']")
  end
end
