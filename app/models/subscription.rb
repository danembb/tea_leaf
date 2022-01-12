class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :title, presence: true
  validates :price, presence: true
  validates :frequency, presence: true
  validates :status, presence: true

  enum frequency: {
    weekly: 0,
    monthly: 1,
    bimonthly: 2,
    yearly: 3
  }

  enum status: {
    active: 0,
    cancelled: 1
  }
end
