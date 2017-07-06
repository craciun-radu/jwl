class AddQuantityToJewels < ActiveRecord::Migration[5.1]
  def change
    add_column :jewels, :quantity, :integer
  end
end
