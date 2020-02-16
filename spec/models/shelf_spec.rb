# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shelf, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:books) }
    it { is_expected.to have_many(:books).through(:book_additions) }
  end
end
