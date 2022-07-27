# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
                                  name: 'MyText',
                                  price: 2.5,
                                  expiration: 'MyText',
                                  currency: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
