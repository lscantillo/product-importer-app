class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :name
      t.float :price
      t.datetime :expiration
      t.references :currency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
