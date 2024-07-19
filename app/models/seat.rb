class Seat < ApplicationRecord


  validates :number, presence: true, uniqueness: { scope: :bus_id }

  belongs_to :bus

end
