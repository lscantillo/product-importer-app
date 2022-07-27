# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :currency
  validates :name, :price, :expiration, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
  validates :name, format: { with: /.*#\(\d{16}\)/ }
end
