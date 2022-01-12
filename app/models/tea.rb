class Tea < ApplicationRecord
  belongs_to :subscription
  has_many :comments, dependent: :destroy
end
