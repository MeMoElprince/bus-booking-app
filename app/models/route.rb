class Route < ApplicationRecord

  validates :cost, presence: true, numericality: { greater_than: 0 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :city1_id, presence: true
  validates :city2_id, presence: true



  belongs_to :city1, class_name: 'City'
  belongs_to :city2, class_name: 'City'
end
