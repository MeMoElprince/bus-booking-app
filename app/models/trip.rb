class Trip < ApplicationRecord

  validates :departure_time , presence: true


  has_many :trip_routes

  belongs_to :departure_city, class_name: 'City', foreign_key: 'departure_city_id'
  belongs_to :arrival_city, class_name: 'City', foreign_key: 'arrival_city_id'
  
  belongs_to :bus
end
