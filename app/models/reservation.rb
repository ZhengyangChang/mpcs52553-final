class Reservation < ApplicationRecord
  belongs_to :house
  belongs_to :renter

  validates :house, uniqueness: { message: "only one guy book the house" }
end
