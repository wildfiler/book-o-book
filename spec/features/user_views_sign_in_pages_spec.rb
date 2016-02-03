require 'rails_helper'
describe 'User visit main page' do
  it 'not signed in' do
    visit books_path
    expect(page).to have_content('Sign in')
    expect(page).to have_content('Sign up')
  end

  it 'signed in' do
    user = create :user
    sign_in(user)
    visit books_path
    expect(page).to have_content('Sign out')
  end
end
