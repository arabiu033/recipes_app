class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all

  validates :name, :measurement_unit, :price, :quantity, presence: true

  def quantity_value
    "#{quantity}#{measurement_unit}"
  end

  def value_price
    "$#{price * quantity}"
  end
end
