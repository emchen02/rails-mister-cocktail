class Dose < ApplicationRecord
  belongs_to :cocktail  #=> def cocktails
  belongs_to :ingredient  #=> def ingredient
  validates :description, presence: true
  validates :ingredient, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient }
end
