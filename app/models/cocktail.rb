class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :image
  validates :name, uniqueness: true, presence: true
  validates :description, length: { maximum: 200 }, on: :create, uniqueness: true, allow_nil: false, presence: true
end
