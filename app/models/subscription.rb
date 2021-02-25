class Subscription < ApplicationRecord
  belongs_to :account
  belongs_to :community
  validates_uniqueness_of :community_id, scope: :account_id
end
