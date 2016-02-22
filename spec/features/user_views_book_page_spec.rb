require 'spec_helper'

describe 'User visits book page' do
  it 'see book information' do
    author = create(
      :author,
      first_name: 'John',
      last_name: 'Doe'
    )
    create(
      :book,
      author: author,
      title: 'Greatest book ever',
      description: 'Some cool reading',
      cover_url: 'http://example.com/cool_cover.jpg',
      published_at: Time.zone.parse('2015-06-19')
    )

    visit books_path
    click_link 'Greatest book ever'

    expect(page).to have_content('John Doe')
    expect(page).to have_content('Greatest book ever')
    expect(page).to have_content('Some cool reading')
    expect(page).to have_content('June 19, 2015')
    expect(page).to have_css("img[src='http://example.com/cool_cover.jpg']")
  end

  describe "didn't sign in" do
    it "can't leave a review for a book" do
      book = create :book

      visit book_path(book)

      expect(page).to have_content('Please sign in to leave a review')
      expect(page).to_not have_content('Leave a review')
    end
  end

  describe 'signed in' do
    it 'sees other users reviews' do
      book = create :book
      user = create :user
      other_user = create :user
      review = create :review, user_id: other_user.id, book_id: book.id

      visit book_path(book)

      expect(page).to have_content(review.comment)
      expect(page).to have_content(other_user.email)
    end

    it "didn't write a review yet" do
      book = create :book
      user = create :user
      sign_in(user)

      visit book_path(book)

      expect(page).to have_content('Leave a review')
    end

    it 'sees review he write' do
      review = create :review

      visit book_path(review.book)

      expect(page).to have_content(review.comment)
      expect(page).to have_content(review.user.email)
      expect(page).to have_content(review.created_at.to_formatted_s(:db))
    end

    it "write a comment and can't leave another one" do
      book = create :book
      user = create :user
      sign_in(user)

      visit book_path(book)

      fill_in 'Leave a review', with:'some text'
      click_button 'Create Review'

      expect(page).to_not have_content('Leave a review')
    end
  end
end
