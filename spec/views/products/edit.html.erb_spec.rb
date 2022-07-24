require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyText",
      price: 1.5,
      expiration: "MyText",
      currency: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "textarea[name=?]", "product[name]"

      assert_select "input[name=?]", "product[price]"

      assert_select "textarea[name=?]", "product[expiration]"

      assert_select "input[name=?]", "product[currency_id]"
    end
  end
end
