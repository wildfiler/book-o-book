require 'rails_helper'

describe Review do
  describe "assosiasions" do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
end
