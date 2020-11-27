class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy #=> def doses
  has_many :ingredients, through: :doses #=> def ingredients
  validates :name, presence: true, uniqueness: true
end
