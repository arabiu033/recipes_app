class User < ApplicationRecord
  has_many :recipe
  has_many :food

  validates :name, presence: true, length: { in: 5..30 }
end
