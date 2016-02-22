require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

  describe 'assosiasions' do
    it { should have_many(:reviews) }
  end

  describe 'when email format is invalid' do
    it 'should be invalid' do
      user = create :user
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it { should_not allow_value(%w[user@foo,com user_at_foo.org example.user@foo.]).for(:email) }
  end
end
