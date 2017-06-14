class CreateJewels < ActiveRecord::Migration[5.1]
  def change
    create_table :jewels do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :image
      t.text :description
      t.timestamps
    end
  end
end
