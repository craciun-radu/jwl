class CreateCartFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_favourites do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
