FactoryBot.define do
  factory :customer_subscription do
    customer { nil }
    subscription { nil }
    active { false }
  end
end
