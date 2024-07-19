class TripRoute < ApplicationRecord

  # validate that the trip_id and route_id are present and unique together
  validates :trip_id, presence: true, uniqueness: { scope: :route_id }
  validates :route_id, presence: true


  belongs_to :trip
  belongs_to :route

end
