class Host < ApplicationRecord
  has_many :houses
  belongs_to :user 

  validates :user, uniqueness: { message: "one to one" }

end
