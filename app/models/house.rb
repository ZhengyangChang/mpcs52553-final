class House < ApplicationRecord
  belongs_to :host
  has_many :reservations

  validates_presence_of :address
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :number_of_bathrooms
  validates_presence_of :rate
  
end
