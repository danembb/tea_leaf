require 'rails_helper'

RSpec.describe 'create subscription endpoint', type: :request do
    before :each do
        @customer = Customer.create!(first_name: 'dane', last_name: 'brophy', email: 'dbrophy@cats.biz', address: '101 Generic Lane, Ware, CO')
        @tea = Tea.create!(name: 'Earl Grey', description: 'tea, earl grey, hot', keywords: 'picard', origin: 'a replicator', brew_time: 2, temperature: 89.7)
    end
    describe 'happy path' do
        it 'can create a subscription', :vcr do
            body = {
                    "tea_id": @tea.id,
                    "title": "green tea guru",
                    "price": 40.00,
                    "frequency": 1
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post "/api/v1/customers/#{@customer.id}/subscriptions", headers: headers, params: body, as: :json

            expect(response).to be_successful
            expect(response.status).to eq(201)
        end
    end
end