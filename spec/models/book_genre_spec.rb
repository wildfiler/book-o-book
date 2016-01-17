require 'rails_helper'

describe BookGenre do
  it { should belong_to(:genre) }
  it { should belong_to(:book) }
end
