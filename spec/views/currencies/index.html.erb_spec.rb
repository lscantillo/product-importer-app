# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'currencies/index', type: :view do
  before(:each) do
    assign(:currencies, [
             Currency.create!(
               name: 'MyText',
               currency_code: 'MyText'
             ),
             Currency.create!(
               name: 'MyText',
               currency_code: 'MyText'
             )
           ])
  end

  it 'renders a list of currencies' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
