class User < ApplicationRecord

  has_secure_password

  has_many :bookings

  validates :username, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true
  validates :phone, presence: true, length: { minimum: 11, maximum: 11 }, uniqueness: true


end
