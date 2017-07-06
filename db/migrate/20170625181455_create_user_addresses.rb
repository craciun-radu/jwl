class CreateUserAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :country
      t.string :region
      t.string :city
      t.string :street
      t.string :street_number
      t.string :postal_code
      t.string :floor
      t.string :apartment
      t.timestamps
    end
  end
end
