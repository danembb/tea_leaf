class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :comments, dependent: :destroy
end
