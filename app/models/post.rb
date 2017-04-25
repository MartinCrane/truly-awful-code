class Post < ApplicationRecord
  belongs_to :account
  has_many :comments
  has_many :votes
end
