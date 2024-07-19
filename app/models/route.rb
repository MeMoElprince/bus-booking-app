class Route < ApplicationRecord

  validates :cost, presence: true, numericality: { greater_than: 0 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :city1_id, presence: true, uniqueness: { scope: :city2_id }
  validates :city2_id, presence: true, uniqueness: { scope: :city1_id }

  has_many :trip_routes

  belongs_to :city1, class_name: 'City'
  belongs_to :city2, class_name: 'City'
end
