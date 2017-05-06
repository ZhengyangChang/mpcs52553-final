class Renter < ApplicationRecord
  has_many :reservations
  belongs_to :user

  validates :user, uniqueness: { message: "one to one" }
end
