# frozen_string_literal: true

module CsvService
  class UploadCsv
    require 'csv'
    require 'tempfile'
    def initialize(csv_file)
      @csv_file = csv_file
      @rows_count = 0
      @rows_rejected = []
    end

    def call
      CSV.foreach(@csv_file, headers: true) do |line|
        row = line[0].split('|')
        price = row[1][1..-1] if row[1].present?
        name = row[0] if valid_name?(row[0])
        Product.transaction do
          product = set_product(name, price, row[2], Currency.first) # TODO: Add other currencies
          if product.valid?
            product.save!
          else
            @rows_rejected << product
            @rows_count += 1
            next
          end
        end
      end
    ensure
      FileUtils.rm_f(@csv_file)
      puts "Rejected rows: #{@rows_rejected}, total rows: #{@rows_count}"
    end

    def set_product(name, price, expiration, currency)
      Product.new(
        name: name,
        price: price,
        expiration: expiration, #TODO: expiration format dd/mm/yyyy
        currency: currency
      )
    end

    def valid_name?(name)
      regex = /^.*#\(\d{16}\)/
      name.match?(regex)
    end
  end
end
