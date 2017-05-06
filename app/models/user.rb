class User < ApplicationRecord
  validates :login, presence: true
  validates :password, presence: true
end
