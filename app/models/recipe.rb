class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all

  validates :name, presence: true, length: { in: 5..30 }
  validates :description, presence: true, length: { in: 10..360 }
  validates :cooking_time, presence: true, length: { in: 1..1000 }, numericality: { greater_than: 0.0 }
  validates :preparation_time, presence: true, length: { in: 1..1000 }, numericality: { greater_than: 0.0 }

  def total_food_items
    RecipeFood.where('recipe_id = ?', id).count
  end

  def total_price
    RecipeFood.joins(:food).where('recipe_id = ?', id).sum('price * foods.quantity')
  end
end
