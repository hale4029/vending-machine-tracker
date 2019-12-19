class Snack < ApplicationRecord
  has_many :machine_items
  has_many :machines, through: :machine_items
end
