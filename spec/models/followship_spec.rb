# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Followship, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:author) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:followship) }

    it { is_expected.to validate_uniqueness_of(:user).scoped_to(:author_id) }
  end
end
