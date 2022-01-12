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

            confirmation = JSON.parse(response.body, symbolize_names: true)
            
            expect(confirmation).to have_key(:data)
            expect(confirmation[:data]).to be_a(Hash)
            expect(confirmation[:data][:customer_id]).to eq(@customer.id)
            expect(confirmation[:data][:tea_id]).to eq(@tea.id)
            expect(confirmation[:data][:title]).to eq("green tea guru")
            expect(confirmation[:data][:price]).to eq(40.00)
            expect(confirmation[:data][:frequency]).to eq("monthly")
            expect(confirmation[:data][:status]).to eq("active")
        end
    end

    describe 'sad path' do
        it 'can provide an error if information is invalid' do
            body = {
                    "tea_id": @tea.id,
                    "title": "green tea guru",
                    "frequency": 1
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            post "/api/v1/customers/#{@customer.id}/subscriptions", headers: headers, params: body, as: :json

            expect(response).to_not be_successful
            expect(response.status).to eq(400)

            error = JSON.parse(response.body, symbolize_names: true)

            expect(error[:error]).to eq("Invalid information provided")
        end
    end
end