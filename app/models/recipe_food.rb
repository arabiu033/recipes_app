class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, length: { in: 1..1000 }, numericality: { only_integer: true }
end
