class City < ApplicationRecord

  validates :name, presence: true, length: { minimum: 2, maximum: 10 }, uniqueness: true
  

end
