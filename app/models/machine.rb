class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_items
  has_many :items, through: :machine_items
end
