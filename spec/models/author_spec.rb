# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { create(:author_with_followers, followers_count: 10) }

  describe 'associations' do
    it { is_expected.to have_many(:books) }
    it { is_expected.to have_many(:followships) }
    it { is_expected.to have_many(:followers).through(:followships) }
  end

  describe '#followers' do
    it 'return correct number of followers' do
      expect(author.followers.count).to eq 10
    end
  end
end
