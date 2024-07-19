class Bus < ApplicationRecord


  has_many :seats

  belongs_to :trip

end
