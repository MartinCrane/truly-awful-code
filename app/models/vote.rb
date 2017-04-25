class Vote < ApplicationRecord
  belongs_to :account
  belongs_to :post
  validates :post_id, uniqueness: { scope: :account_id }
end
