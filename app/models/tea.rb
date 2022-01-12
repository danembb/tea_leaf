class Tea < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :keywords, presence: true
  validates :origin, presence: true
  validates :brew_time, presence: true
  validates :temperature, presence: true
end
