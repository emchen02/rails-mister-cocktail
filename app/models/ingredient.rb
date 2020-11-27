class Ingredient < ApplicationRecord
  has_many :doses  #=> def doses
  validates :name, presence: true, uniqueness: true
end
