class Dp < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :product_number, presence: true
  validates :category, numericality: {other_than: 0, message: "選んでください"}
end