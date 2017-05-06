class House < ApplicationRecord
  belongs_to :host
  has_many :reservations
end
