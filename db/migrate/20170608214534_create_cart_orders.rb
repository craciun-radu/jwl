class CreateCartOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_orders do |t|
      t.integer :user_id
      t.string :status, default: "active"
      t.timestamps
    end
  end
end
