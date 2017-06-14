class CreateCartOrderJewels < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_order_jewels do |t|
      t.integer :jewel_id
      t.integer :cart_order_id
      t.timestamps
    end
  end
end
