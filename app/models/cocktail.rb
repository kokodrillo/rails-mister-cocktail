class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :descriptions, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true


end
