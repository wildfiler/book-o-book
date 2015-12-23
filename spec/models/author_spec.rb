require 'rails_helper'

describe Author do
  describe '#full_name' do
    it 'returns joined first name and last name' do
      author = build(:author, first_name: 'Obi-Wan', last_name: 'Kenobi')

      full_name = author.full_name

      expect(full_name).to eq('Obi-Wan Kenobi')
    end
  end
end
