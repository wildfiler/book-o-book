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
end
