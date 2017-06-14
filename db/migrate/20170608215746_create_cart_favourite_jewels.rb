class CreateCartFavouriteJewels < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_favourite_jewels do |t|
      t.integer :jewel_id
      t.integer :cart_favourite_id
      t.timestamps
    end
  end
end
