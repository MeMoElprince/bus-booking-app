class Booking < ApplicationRecord

  # validate that the trip_route_id and seat_id are present and unique together

  belongs_to :trip 
  belongs_to :user

  belongs_to :city1 , class_name: "City"
  belongs_to :city2 , class_name: "City"

end
