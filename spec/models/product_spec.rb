# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'valid factory' do
    it { expect(FactoryBot.build(:product)).to be_valid }
  end

  describe 'Associations' do
    it { should belong_to(:currency) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:expiration) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end
end
