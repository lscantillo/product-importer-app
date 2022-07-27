# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    assign(:product, Product.new(
                       name: 'MyText',
                       price: 1.5,
                       expiration: 'MyText',
                       currency: nil
                     ))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', products_path, 'post' do
      assert_select 'textarea[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'textarea[name=?]', 'product[expiration]'

      assert_select 'input[name=?]', 'product[currency_id]'
    end
  end
end
