class Booking < ApplicationRecord

  # validate that the trip_route_id and seat_id are present and unique together

  belongs_to :trip 
  belongs_to :user

end
