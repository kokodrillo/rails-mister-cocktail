class Ingredient < ApplicationRecord
  has_many :doses #do i need an id
  validates :name, uniqueness: true, presence: true
end
