class CustomersSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :email, :address
  # class << self
  #   def new(customer)
  #     {
  #       "data": {
  #         "id": customer.id,
  #         "first_name": customer.first_name,
  #         "last_name": customer.last_name,
  #         "email": customer.email,
  #         "address": customer.address
  #       }
  #     }
  #   end
  # end
end
