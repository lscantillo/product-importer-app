# frozen_string_literal: true

module Api
  class DashboardController < ApplicationController
    include Pagy::Backend

    def stats
      @currencies_count = Currency.all.count
      @products_count = Product.all.count
      params[:items] ||= Pagy::DEFAULT[:items]
      params[:page] ||= Pagy::DEFAULT[:page]
      @pagy, @products = pagy(Product.all)
      @pagy, @currencies = pagy(Currency.all)

      render json: { total_currencies: @currencies_count,
                     total_products: @products_count,
                     products: @products,
                     currencies: @currencies,
                     pagy: pagy_metadata(@pagy) }
    end
  end
end
