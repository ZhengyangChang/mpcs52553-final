class Message < ApplicationRecord
  belongs_to :house
  belongs_to :renter
end
