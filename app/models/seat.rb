class Seat < ApplicationRecord


  validates :number, presence: true, uniqueness: true

  belongs_to :bus

end
