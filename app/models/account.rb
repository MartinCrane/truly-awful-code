class Account < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :votes
  has_secure_password
end
