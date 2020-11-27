class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy #=> def doses
  has_many :ingredients, through: :doses #=> def ingredients
  validates :name, presence: true, uniqueness: true
end
