require 'rails_helper'

RSpec.describe 'create subscription endpoint', type: :request do
    before :each do
        dane = Customer.create!("first_name": "dane", "last_name": "brophy", "email": "dbrophy@cats.biz", "address": "101 Generic Drive, Ware, CO")
    end
    describe 'happy path' do
        xit 'can create a subscription', :vcr do
            body = {
                    "subscription_id": 1,
                    "customer_id": 1
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post "/api/v1/customers/#{dane.id}/subscriptions", headers: headers, params: body, as: :json

            expect(response).to be_successful
            expect(response.status).to eq(201)
        end
    end
end