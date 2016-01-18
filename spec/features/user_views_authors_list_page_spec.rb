require 'rails_helper'

describe 'when user visit authors list page' do
  it 'sees authors full names, links to their pages and biography' do
    authors = create_list :author, 2
    visit authors_path

    authors.each do |author|
      expect(page).to have_css('.name', author.full_name)
      expect(page).to have_link(author.full_name, author_path(author))
      expect(page).to have_css('.biography', author.biography)
    end
  end

  it 'sees 5 last books images' do
    author = create :author
    old_book = create :book, author: author, published_at: 2.day.ago
    last_5_books = create_list :book, 5, author: author, published_at: 1.day.ago
    visit authors_path

    expect(page).to_not have_css("img[src='#{old_book.cover_url}']")
    last_5_books.each do |book|
      page_have_a_book(book)
    end
  end

  def page_have_a_book(book)
    expect(page).to have_css(".book img[src='#{book.cover_url}']")
  end
end
