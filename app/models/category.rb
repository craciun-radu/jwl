class Category < ApplicationRecord
  has_many :jewels, dependent: :destroy
end
