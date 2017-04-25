class Vote < ApplicationRecord
  belongs_to :account
  belongs_to :post
  validates :uniqueness, :post_id, scope: :account_id
end
