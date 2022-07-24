class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.text :name
      t.text :currency_code

      t.timestamps
    end
  end
end
