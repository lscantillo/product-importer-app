require 'rails_helper'

RSpec.describe "currencies/edit", type: :view do
  before(:each) do
    @currency = assign(:currency, Currency.create!(
      name: "MyText",
      currency_code: "MyText"
    ))
  end

  it "renders the edit currency form" do
    render

    assert_select "form[action=?][method=?]", currency_path(@currency), "post" do

      assert_select "textarea[name=?]", "currency[name]"

      assert_select "textarea[name=?]", "currency[currency_code]"
    end
  end
end
