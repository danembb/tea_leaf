require 'rails_helper'

RSpec.describe 'create subscription endpoint', type: :request do
    before :each do
        @customer = Customer.create!(first_name: 'dane', last_name: 'brophy', email: 'dbrophy@cats.biz', address: '101 Generic Lane, Ware, CO')
        @tea = Tea.create!(name: 'green tea', description: 'so nice', keywords: 'earthy, zen', origin: 'somewhere', brew_time: 3, temperature: 90)
        @tea2 = Tea.create!(name: 'Earl Grey', description: 'tea, earl grey, hot', keywords: 'picard', origin: 'a replicator', brew_time: 2, temperature: 89.7)
    end

    describe 'happy paths' do
        it 'can create a subscription' do
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
            expect(confirmation[:data][:attributes][:customer_id]).to eq(@customer.id)
            expect(confirmation[:data][:attributes][:tea_id]).to eq(@tea.id)
            expect(confirmation[:data][:attributes][:title]).to eq("green tea guru")
            expect(confirmation[:data][:attributes][:price]).to eq(40.00)
            expect(confirmation[:data][:attributes][:frequency]).to eq("monthly")
            expect(confirmation[:data][:attributes][:status]).to eq("active")
        end

        it 'can update a subscription' do
            guru = Subscription.create!(customer_id: @customer.id, tea_id: @tea.id, title: "green tea guru", price: 40.00, frequency: 1)
            
            body = {
                "status": 1
            }

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            patch "/api/v1/customers/#{@customer.id}/subscriptions/#{guru.id}", headers: headers, params: body, as: :json

            expect(response).to be_successful
            expect(response.status).to eq(200)

            confirmation = JSON.parse(response.body, symbolize_names: true)
            
            expect(confirmation).to have_key(:data)
            expect(confirmation[:data]).to be_a(Hash)
            expect(confirmation[:data][:attributes][:customer_id]).to eq(@customer.id)
            expect(confirmation[:data][:attributes][:tea_id]).to eq(@tea.id)
            expect(confirmation[:data][:attributes][:title]).to eq("green tea guru")
            expect(confirmation[:data][:attributes][:price]).to eq(40.00)
            expect(confirmation[:data][:attributes][:frequency]).to eq("monthly")
            expect(confirmation[:data][:attributes][:status]).to eq("cancelled")
        end

        it 'can return all subscriptions for a given customer' do
            guru = Subscription.create!(customer_id: @customer.id, tea_id: @tea.id, title: "green tea guru", price: 40.00, frequency: 1)
            picard = Subscription.create!(customer_id: @customer.id, tea_id: @tea.id, title: "the maneuver", price: 60.33, frequency: 0)

            headers = { 'CONTENT_TYPE': 'application/json', "Accept": 'application/json' }

            get "/api/v1/customers/#{@customer.id}/subscriptions", headers: headers, as: :json

            expect(response).to be_successful
            expect(response.status).to eq(200)

            confirmation = JSON.parse(response.body, symbolize_names: true)
            
            expect(confirmation).to have_key(:data)
            expect(confirmation[:data]).to be_an(Array)
        end
    end

    describe 'sad paths' do
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