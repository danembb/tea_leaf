class SubscriptionsSerializer
    include JSONAPI::Serializer
    attributes :customer_id, :tea_id, :title, :price, :frequency, :status
#   class << self
#     def new(subscriptions)
#       {
#         "data": {
#           "customer_id": subscriptions.customer_id,
#           "tea_id": subscriptions.tea_id,
#           "title": subscriptions.title,
#           "price": subscriptions.price,
#           "frequency": subscriptions.frequency,
#           "status": subscriptions.status
#         }
#       }
#     end
#   end
end
