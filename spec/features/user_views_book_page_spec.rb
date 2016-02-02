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
    it "sees other users reviews" do
      book = create :book
      user = create :user, email: 'foo@bar.com'
      other_user = create :user, email: 'foo1@bar.com'
      review = create :review, user_id: other_user.id, book_id: book.id
      sign_in(user)
      visit book_path(book)
      expect(page).to have_content(review.comment)
      expect(page).to have_content(review.user.email)
    end

    it "didn't write a review yet" do
      book = create :book
      user = create :user
      sign_in(user)
      visit book_path(book)
      expect(page).to have_content('Leave a review')
    end

    it "already write a review" do
      book = create :book
      user = create :user
      review = create :review, user_id: user.id, book_id: book.id
      sign_in(user)
      visit book_path(book)
      expect(page).to have_content(review.comment)
      expect(page).to have_content(review.user.email)
      expect(page).to have_content(review.created_at.to_formatted_s(:db))
    end
  end
end
