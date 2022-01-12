class SubscriptionsSerializer
  class << self
    def new(subscription)
      {
        "data": {
          "customer_id": subscription.customer_id,
          "tea_id": subscription.tea_id,
          "title": subscription.title,
          "price": subscription.price,
          "frequency": subscription.frequency,
          "status": subscription.status,
        }
      }
    end
  end
end
