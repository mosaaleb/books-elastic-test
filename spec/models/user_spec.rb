# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  describe 'associations' do
    it 'has one book shelf' do
      assc = described_class.reflect_on_association(:shelf)
      expect(assc.macro).to eq :has_one
    end

    it 'has many added books' do
      assc = described_class.reflect_on_association(:added_books)
      expect(assc.macro).to eq :has_many
    end
  end
end
