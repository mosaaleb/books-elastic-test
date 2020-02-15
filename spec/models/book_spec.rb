# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:book_additions) }
    it { is_expected.to have_many(:shelves).through(:book_additions) }

    it 'has one attached file' do
      expect(described_class.new.cover)
        .to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_presence_of(:cover) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:isbn13) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
