class City < ApplicationRecord

  validates :name, presence: true, length: { minimum: 2, maximum: 10 }, uniqueness: true

  has_many :bookings
  has_many :routes 
  has_many :trips

end
