# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'currencies/new', type: :view do
  before(:each) do
    assign(:currency, Currency.new(
                        name: 'MyText',
                        currency_code: 'MyText'
                      ))
  end

  it 'renders new currency form' do
    render

    assert_select 'form[action=?][method=?]', currencies_path, 'post' do
      assert_select 'textarea[name=?]', 'currency[name]'

      assert_select 'textarea[name=?]', 'currency[currency_code]'
    end
  end
end
