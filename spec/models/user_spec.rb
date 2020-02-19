# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }
  let(:book) { build :book }

  describe 'associations' do
    it { is_expected.to have_one(:shelf) }

    it 'has one attached file' do
      expect(described_class.new.avatar)
        .to be_an_instance_of(ActiveStorage::Attached::One)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to allow_value('muhammad').for(:username) }
    it { is_expected.not_to allow_value('*mmkad').for(:username) }
  end

  describe '#add_book_to_shelf' do
    it 'adds book to user library' do
      user.add_book_to_shelf(book)
      expect(user.shelf.books.count).to eq(1)
    end
  end

  describe '#remove_book_from_shelf' do
    before { user.shelf.books << book }

    it 'removes book from user library' do
      user.remove_book_from_shelf(book)
      expect(user.shelf.books.count).to eq(0)
    end
  end

  describe '#already_added?' do
    it 'returns trune if user already added a book' do
      user.shelf.books << book
      expect(user.already_added?(book)).to eq(true)
    end

    it 'returns false if user haven\'t added a book' do
      expect(user.already_added?(book)).to eq(false)
    end
  end
end
