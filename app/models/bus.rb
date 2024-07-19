class Bus < ApplicationRecord


  has_many :seats

  has_many :trips

end
