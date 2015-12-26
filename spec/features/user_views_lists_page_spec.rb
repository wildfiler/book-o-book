require 'rails_helper'

describe 'User views lists page' do
  it 'see list of book lists' do
    book1 = create :book
    book2 = create :book
    book3 = create :book
    create :list, title: 'Book list 1', books: [book1, book2]
    create :list, title: 'Book list 2', books: [book2, book3]

    visit lists_path

    expect(page).to have_content('Book Lists')
    expect(page).to have_content('Book list 1')
    expect(page).to have_content('Book list 2')
  end

  it 'see five book covers for a list' do
    books = create_list :book, 6

    create :list, books: books

    visit lists_path

    expect(page).to have_css('.list > .covers > .cover img', count: 5)
  end
end
