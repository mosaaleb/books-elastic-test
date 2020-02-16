# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookAddition, type: :model do
  let(:book) { build :book }

  describe 'association' do
    it { p book.status }
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:shelf) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:book_addition) }

    it { is_expected.to validate_uniqueness_of(:book).scoped_to(:shelf_id) }
  end
end
