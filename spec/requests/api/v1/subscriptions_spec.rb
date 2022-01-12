require 'rails_helper'

RSpec.describe 'create subscription endpoint', type: :request do
    describe 'happy path' do
        it 'can create a subscription', :vcr do
            body = {
                    "tea_id": 1
                    "title": "green tea guru",
                    "price": 40.00,
                    "frequency": 1
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post "/api/v1/customers/1/subscriptions", headers: headers, params: body, as: :json

            expect(response).to be_successful
            expect(response.status).to eq(201)
        end
    end
end