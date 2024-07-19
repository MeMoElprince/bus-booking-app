class Trip < ApplicationRecord

  validates :departure_time , presence: true



  
  belongs_to :departure_city, class_name: 'City'
  belongs_to :arrival_city, class_name: 'City'
end
