class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true

  belongs_to :host
  belongs_to :renter

  validates :email, uniqueness: { message: "Email address already taken." }

end
