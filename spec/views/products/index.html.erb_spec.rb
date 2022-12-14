# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               name: 'MyText',
               price: 2.5,
               expiration: 'MyText',
               currency: nil
             ),
             Product.create!(
               name: 'MyText',
               price: 2.5,
               expiration: 'MyText',
               currency: nil
             )
           ])
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
