class CartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: { on_delete: :cascade }
      t.references :product, null: false, foreign_key: { on_delete: :cascade }
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
