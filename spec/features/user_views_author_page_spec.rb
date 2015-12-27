require 'rails_helper'

describe 'User visits author page' do
  it 'see author information and book list' do
    author = create(
      :author,
      first_name: 'Foo',
      last_name: 'Bar',
      biography: 'some weird stuff'
    )
    books = create_list :book, 2, author: author

    visit author_path author

    expect(page).to have_content('Foo Bar')
    expect(page).to have_content('some weird stuff')
    books.each do |book|
      page_have_a_book book
    end
  end

  def page_have_a_book(book)
    expect(page).to have_css('.title', text: book.title)
    expect(page).to have_css('.description', text: book.description)
    expect(page).to have_css(".cover img[src='#{book.cover_url}']")
  end
end
