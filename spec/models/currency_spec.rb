# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Currency, type: :model do
  context 'valid factory' do
    it { expect(FactoryBot.build(:currency)).to be_valid }
  end

  describe 'Associations' do
    it { should have_many(:products) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:currency_code) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:currency_code) }
  end
end
