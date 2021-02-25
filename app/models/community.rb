class Community < ApplicationRecord
  belongs_to :account
  has_many :posts
  has_many :subscriptions
  validates_presence_of :url, :name, :rules
  has_many :subscribers, through: :subscriptions, source: :account
end
