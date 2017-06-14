class ChangeJewelsCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :jewels, :category, :string
    add_column :jewels, :category_id, :integer
  end
end
