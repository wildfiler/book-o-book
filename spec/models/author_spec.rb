require 'rails_helper'

describe Author do
  describe '#full_name' do
    it 'returns joined first name and last name' do
      author = build(:author, first_name: 'Obi-Wan', last_name: 'Kenobi')

      full_name = author.full_name

      expect(full_name).to eq('Obi-Wan Kenobi')
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:biography) }
  end
end
