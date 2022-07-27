# frozen_string_literal: true

class Currency < ApplicationRecord
  has_many :products
  validates :name, presence: true
  validates :currency_code, presence: true
  validates :name, uniqueness: true
  validates :currency_code, uniqueness: true
end
