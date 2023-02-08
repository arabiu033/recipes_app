class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all

  validates :name, presence: true, length: { in: 5..30 }
  validates :description, presence: true, length: { in: 10..350 }
  validates :cooking_time, presence: true, length: { in: 1..1000 }, numericality: { greater_than: 0.0 }
  validates :preparation_time, presence: true, length: { in: 1..1000 }, numericality: { greater_than: 0.0 }
end
