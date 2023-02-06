class User < ApplicationRecord
  belongs_to :recipe
  has_many :food

  validates :name, presence: true, length: { in: 5..30 }
end
