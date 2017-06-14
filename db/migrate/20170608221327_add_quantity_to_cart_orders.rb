class AddQuantityToCartOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_order_jewels, :quantity, :integer, default: 1
  end
end
